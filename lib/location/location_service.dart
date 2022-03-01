import 'dart:async';
import 'dart:io';

import 'package:bumaco_aios/app_utils/app_loading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationService {
  // / Determine the current position of the device.
  // /
  // / When the location services are not enabled or permissions
  // / are denied the `Future` will return an error.
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      hideLoadingDialog();
      Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Geolocator.openAppSettings();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Last known location stored on the device
    // (note that this can result in a null value when no location details are available):
    // Position position = await Geolocator.getLastKnownPosition();
    // var accuracy = await Geolocator.getLocationAccuracy();
    // double distanceInMeters = Geolocator.distanceBetween(52.2165157, 6.9437819, 52.3546274, 4.8285838);
    // double bearing = Geolocator.bearingBetween(52.2165157, 6.9437819, 52.3546274, 4.8285838);

    // Listen to location updates to listen for location changes
    // late LocationSettings locationSettings;
    // if (Platform.isAndroid) {
    //   locationSettings = AndroidSettings(
    //     accuracy: LocationAccuracy.high,
    //     distanceFilter: 100,
    //     forceLocationManager: true,
    //     intervalDuration: const Duration(seconds: 10),
    //   );
    // } else if (Platform.isIOS || Platform.isMacOS) {
    //   locationSettings = AppleSettings(
    //     accuracy: LocationAccuracy.high,
    //     // activityType: ActivityType.fitness,
    //     distanceFilter: 100,
    //     pauseLocationUpdatesAutomatically: true,
    //   );
    // } else {
    //   locationSettings = LocationSettings(
    //     accuracy: LocationAccuracy.high,
    //     distanceFilter: 100,
    //   );
    // }
    // StreamSubscription<Position> positionStream =
    //     Geolocator.getPositionStream(locationSettings: locationSettings)
    //         .listen((Position position) {
    //   print(position == null
    //       ? 'Position---->Unknown'
    //       : 'Position---->' +
    //           position.latitude.toString() +
    //           ', ' +
    //           position.longitude.toString());
    // });
    // StreamSubscription<ServiceStatus> serviceStatusStream =
    //     Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
    //   print(status);
    // });

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  static Future<Placemark?> getAddressFromPosition(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.length > 0) {
      for (int i = 0; i < placemarks.length; i++) {
        print('--------placemarks-->$i-------->${placemarks[i]}');
      }
      return placemarks[0];
    }
    return null;
  }
}

///**
///
// I/flutter (32656):       Latitude: 28.448479,
// I/flutter (32656):       Longitude: 77.0758733,
// I/flutter (32656):       Timestamp: 2022-01-12 03:21:27.988Z

// I/flutter (32656): [      Name: 107,
// I/flutter (32656):       Street: 107,
// I/flutter (32656):       ISO Country Code: IN,
// I/flutter (32656):       Country: India,
// I/flutter (32656):       Postal code: 122003,
// I/flutter (32656):       Administrative area: Haryana,
// I/flutter (32656):       Subadministrative area: Gurgaon,
// I/flutter (32656):       Locality: Gurugram,
// I/flutter (32656):       Sublocality: Sector 44,
// I/flutter (32656):       Thoroughfare: ,
// I/flutter (32656):       Subthoroughfare: ,       Name: Unnamed Road,
// I/flutter (32656):       Street: Unnamed Road,
// I/flutter (32656):       ISO Country Code: IN,
// I/flutter (32656):       Country: India,
// I/flutter (32656):       Postal code: 122003,
// I/flutter (32656):       Administrative area: Haryana,
// I/flutter (32656):       Subadministrative area: Gurgaon,
// I/flutter (32656):       Locality: Gurugram,
// I/flutter (32656):       Sublocality: Sector 44,
// I/flutter (32656):       Thoroughfare: Unnamed Road,
// I/flutter (32656):       Subthoroughfare: ,       Name: Kanhai Colony,
// I/flutter (32656):       Street: Kanhai Colony,
// I/flutter (32656):       ISO Country Code: IN,
// I/flutter (32656):       Country: India,
// I/flutter (32656):       Postal code: 122003,
// I/flutter (32656):       Administrative area: Haryana,
// I/flutter (32656):       Subadministrative area: Gurgaon,
// I/flutter (32656):       Locality: Gurugram,
// I/flutter (32656):       Sublocality: Sector 44,
// I/flutter (32656):       Thoroughfare: ,
// I/flutter (32656):       Subthoroughfare: ,       Name: Sector 44,
// I/flutter (32656):       Street: Sector 44,
// I/flutter (32656):       ISO Country Code: IN,

/// */
