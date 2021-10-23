import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';

class AddAddressView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddAddressViewState();
}

class AddAddressViewState extends State<AddAddressView> {
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
        // NameEdit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: _addressController.nameCTR,
            decoration: InputDecoration(
              labelText: "Name", // Set text upper animation
              suffixIcon: Icon(
                Icons.person,
                color: kPrimaryColor,
              ),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.text,
          ),
        ),

        // Address Line 1 Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: _addressController.aLine1CTR,
            decoration: InputDecoration(
              labelText: "Address Line 1",
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.location_city_rounded,
                color: kPrimaryColor,
              ),
            ),
            minLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
          ),
        ),

        // Address Line 2 Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: _addressController.aLine2CTR,
            decoration: InputDecoration(
              labelText: "Address Line 2 (optional)",
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.location_city_rounded,
                color: kPrimaryColor,
              ),
            ),
            minLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
          ),
        ),

        // City Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: _addressController.cityCTR,
            decoration: InputDecoration(
              labelText: "City", // Set text upper animation
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.location_city_rounded,
                color: kPrimaryColor,
              ),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.text,
          ),
        ),

        // Postal Code Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: _addressController.pinCTR,
            decoration: InputDecoration(
              labelText: "Postal Code", // Set text upper animation
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.pin_drop_rounded,
                color: kPrimaryColor,
              ),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.number,
          ),
        ),

        // Phone Number Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: _addressController.phoneCTR,
            decoration: InputDecoration(
              labelText: "Phone Number", // Set text upper animation
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.phone_android_rounded,
                color: kPrimaryColor,
              ),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.number,
          ),
        ),

        // Login Button
        Center(
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
                        gradient: LinearGradient(
                            colors: [
                              kPrimaryColorDark, kPrimaryColor
                              //  Color(0xff374ABE), Color(0xff64B6FF)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Container(
                      constraints: const BoxConstraints(
                          maxWidth: 300.0,
                          minHeight: 40.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text(
                        'Add Address',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ))),
      ],
    );
  }
}
