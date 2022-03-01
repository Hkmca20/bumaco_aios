import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/location/location_service.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/widgets/section_tile.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class AddressAddView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddressAddViewState();
}

class AddressAddViewState extends State<AddressAddView> {
  final _addressController = AddressController.to;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHome(
        title: "Add Shipping Address",
      ),
      body: SingleChildScrollView(
        child: initScreen(),
      ),
    );
  }

  Widget initScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HStack(
          [
            'Address'.text.base.bold.make().expand(),
            'Auto Detect'
                .text
                .base
                .color(kPrimaryColor)
                .make()
                .pSymmetric(v: 10)
                .onInkTap(() async {
              showLoadingDialog();
              // Location loc = Location(
              //     latitude: 0.0, longitude: 0.0, timestamp: DateTime.now());
              // List<Location> locations =
              //     await locationFromAddress("Sector 44,noi");
              // for (int i = 0; i < locations.length; i++) {
              //   loc = locations[i];
              //   print('-----------location-->$i---->$loc');
              // }
              Position pos = await LocationService.determinePosition();
              Placemark? pm = await LocationService.getAddressFromPosition(pos);
              hideLoadingDialog();
              if (pm != null) {
                _addressController.aLine1CTR.text = pm.name.toString() +
                    ', ' +
                    pm.thoroughfare.toString() +
                    ', ' +
                    pm.street.toString() +
                    ', ' +
                    pm.subLocality.toString();
                _addressController.aLine2CTR.text = pm.locality.toString() +
                    ', ' +
                    pm.subAdministrativeArea.toString() +
                    ', ' +
                    pm.administrativeArea.toString() +
                    ', ' +
                    pm.country.toString() +
                    ' - ' +
                    pm.isoCountryCode.toString();
                _addressController.cityCTR.text =
                    pm.subAdministrativeArea.toString();
                _addressController.pinCTR.text = pm.postalCode.toString();
              }
            }),
            Icon(
              Icons.location_history,
              color: kPrimaryColor,
            )
          ],
          // alignment: MainAxisAlignment.spaceBetween,
        ).pOnly(left: 20, right: 20, top: 20),
        // Address Line 1 Edit text
        createTextWidget('Address Line 1', _addressController.aLine1CTR,
            Icons.location_city_rounded, TextInputType.emailAddress),

        // Address Line 2 Edit text
        createTextWidget(
            'Address Line 2 (optional)',
            _addressController.aLine2CTR,
            Icons.location_city_rounded,
            TextInputType.text),

        // City Edit text
        createTextWidget('City', _addressController.cityCTR,
            Icons.location_city_rounded, TextInputType.text),

        // Postal Code Edit text
        createTextWidget('Postal Code', _addressController.pinCTR,
            Icons.pin_drop_rounded, TextInputType.number),

        HStack(
          [
            'Contact'.text.base.bold.make().expand(),
            'Default'.text.base.make(),
            Switch(
              activeColor: kPrimaryColor,
              onChanged: (value) {},
              value: true,
            ),
          ],
          // alignment: MainAxisAlignment.spaceBetween,
        ).pOnly(left: 20, right: 20, top: 20),

        // NameEdit text
        createTextWidget('Name', _addressController.nameCTR, Icons.person,
            TextInputType.text),

        // Phone Number Edit text
        createTextWidget('Phone Number', _addressController.phoneCTR,
            Icons.phone_android_rounded, TextInputType.number),

        // Submit Button
        submitButtonWidget(),
      ],
    );
  }

  createTextWidget(labelText, eController, icon, keyType) {
    return Container(
      margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
      child: TextFormField(
        controller: eController,
        decoration: InputDecoration(
          labelText: labelText, // Set text upper animation
          suffixIcon: Icon(
            icon,
            color: kPrimaryColor,
          ),
        ),
        minLines: 1,
        autofocus: false,
        keyboardType: keyType,
      ),
    );
  }

  submitButtonWidget() {
    return Center(
        child: Container(
            margin: EdgeInsets.only(top: 50.0, bottom: 10.0),
            child: RaisedButton(
              onPressed: () {
                _addressController.submitAddress();
              }, // Click Listener

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      kPrimaryColorDark, kPrimaryColor
                      //  Color(0xff374ABE), Color(0xff64B6FF)
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Container(
                  constraints: const BoxConstraints(
                      maxWidth: 300.0,
                      minHeight: 40.0), // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: 'submit'.tr.text.uppercase.white.xl.center.make(),
                ),
              ),
            )));
  }
}
