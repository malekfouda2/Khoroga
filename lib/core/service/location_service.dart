import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


class LocationService extends GetxController {
  Position? currentPosition;
  List<dynamic>? nearbyPlaces;

  final String apiKey = 'AIzaSyBVBayPpfe9wy8HX6SVoSsAiVFPj2furWo'; // Replace with your Google Places API key

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      bool hasPermission = await _requestLocationPermission();

      if (!hasPermission) {
        print('Error: User denied permissions to access the device\'s location.');
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      currentPosition = position;
      update();
      fetchNearbyPlaces();
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<bool> _requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    return status.isGranted;
  }

  Future<void> fetchNearbyPlaces() async {
    if (currentPosition == null) return;

    const String baseUrl =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
    const double radius = 1000; // Replace with your desired radius

    final String url =
        '$baseUrl?location=${currentPosition!.latitude},${currentPosition!.longitude}&radius=$radius&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      final responseData = json.decode(response.body);
      nearbyPlaces = responseData['results'];
      update();
    } catch (e) {
      print('Error: $e');
    }
  }
}
