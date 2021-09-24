import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

Future<List<Address>> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  permission = await Geolocator.checkPermission();

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return null;
    // return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return null;
      // return Future.error('Location permissions are denied');
    }
  } else if (permission == LocationPermission.deniedForever) {
    return null;
    // return Future.error(
    // 'Location permissions are permanently denied, we cannot request permissions.');
  } else {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final coordinates = new Coordinates(position.latitude, position.longitude);

    return await Geocoder.local.findAddressesFromCoordinates(coordinates);
  }
  return null;
}
