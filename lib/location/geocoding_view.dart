import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:bumaco_aios/location/location_service.dart';
import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

/// A Flutter example demonstrating how the [pluginName] plugin could be used

class GeoCodingView extends StatelessWidget {
  GeoCodingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHome(title: 'GeoLocator'),
      body: ElevatedButton(
        child: Text('Get Location'),
        onPressed: () async {
          print('locations[i]-----------------');
          showLoadingDialog();
          // Location loc = Location(
          //     latitude: 0.0, longitude: 0.0, timestamp: DateTime.now());
          // List<Location> locations = await locationFromAddress("Sector 44,noi");
          // for (int i = 0; i < locations.length; i++) {
          //   loc = locations[i];
          //   print('-----------location-->$i---->$loc');
          // }
          // List<Placemark> placemarks =
          //     await placemarkFromCoordinates(loc.latitude, loc.longitude);
          // for (int i = 0; i < placemarks.length; i++) {
          //   Placemark pm = placemarks[i];
          //   print('--------placemarks-->$i-------->$pm');
          // }
          Position pos = await LocationService.determinePosition();
          print('---------->$pos');
          hideLoadingDialog();
        },
      ),
    );
  }
}
