import 'package:bumaco_aios/location/user_locaion.dart';
import 'package:location/location.dart';

class LocationService {
  //Keep track of current location
  late UserLocation _currentLocation;

  var location = Location();

//Get one time location and return
  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude ?? 0.0,
        longitude: userLocation.longitude ?? 0.0,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }

    return _currentLocation;
  }
}
// StreamController<UserLocation> _locationController =
//       StreamController<UserLocation>();

//Continuously emit location updates
// StreamController<UserLocation> _locationController =
//       StreamController<UserLocation>().broadcast();

//   Stream<UserLocation> get locationStream => _locationController.stream;

  // LocationService() {
  //   // Request permission to use location
  //   location.requestPermission().then((granted) {
  //     if (granted) {
  //       // If granted listen to the onLocationChanged stream and emit over our controller
  //       location.onLocationChanged().listen((locationData) {
  //         if (locationData != null) {
  //           _locationController.add(UserLocation(
  //             latitude: locationData.latitude,
  //             longitude: locationData.longitude,
  //           ));
  //         }
  //       });
  //     }
  //   });
  // }

// var userLocation = Provider.of<UserLocation>(context);

// Text('Location: Lat${userLocation?.latitude}, Long: ${userLocation?.longitude}'),
    