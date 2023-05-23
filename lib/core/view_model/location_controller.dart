import 'dart:convert';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:khoroga/model/nearby_model.dart';
import 'package:http/http.dart' as http;

class LocationController extends GetxController {
  RxList<NearbyModel> nearbyPlaces = <NearbyModel>[].obs;
  RxBool isLoading = false.obs;
  final double radius = 1000; // Specify the radius in meters

  @override
  void onInit() {
    fetchLocationData();
    super.onInit();
  }

  Future<void> fetchLocationData() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      print("Error: Location permission denied");
      return;
    } else if (permission == LocationPermission.deniedForever) {
      print("Error: Location permission denied forever");
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    double latitude = position.latitude;
    double longitude = position.longitude;

    final apiUrl = 'https://overpass-api.de/api/interpreter';
    final query = '''
      [out:json];
      node(around:$radius, $latitude, $longitude)[amenity];
      out;
    ''';
    final response = await http.post(Uri.parse(apiUrl), body: query);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final places = List<Map<String, dynamic>>.from(data['elements']);

      nearbyPlaces.value = places
          .map((place) => NearbyModel(
        place['tags']['name'] ?? '',
        place['tags']['address'] ?? '',
      ))
          .toList();

      print('Latitude: $latitude');
      print('Longitude: $longitude');
      print('Nearby Places:');
      nearbyPlaces.forEach((place) {
        print('- ${place.name}');
        print('  ${place.address}');
      });
    } else {
      print('Error: ${response.statusCode}');
    }

    isLoading.value = false;
  }
}
