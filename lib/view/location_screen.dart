import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/service/location_service.dart';

class NearbyPlacesScreen extends StatelessWidget {
  final LocationService locationService = Get.find<LocationService>();

  @override
  Widget build(BuildContext context) {
    final List<dynamic>? nearbyPlaces = locationService.nearbyPlaces;

    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Places'),
      ),
      body: nearbyPlaces != null
          ? ListView.builder(
              itemCount: nearbyPlaces.length,
              itemBuilder: (context, index) {
                final place = nearbyPlaces[index];
                final name = place['name'];
                final vicinity = place['vicinity'] ?? 'Unknown';
                final photos = place['photos'];

                // Get the first photo reference and construct the image URL
                String imageUrl = '';
                if (photos != null && photos.length > 0) {
                  final photoReference = photos[0]['photo_reference'];
                  imageUrl =
                      'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=${locationService.apiKey}';
                }

                return Container(
                  margin: EdgeInsets.only(bottom: 8), // Add margin bottom for spacing
                  child: ListTile(
                    title: Text(name),
                    subtitle: Text(vicinity),
                    leading: imageUrl.isNotEmpty
                        ? Image.network(
                            imageUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              // Placeholder icon when loading fails
                              return Icon(
                                Icons.photo,
                                size: 100,
                              );
                            },
                          )
                        : Icon(
                            Icons.photo,
                            size: 70,
                          ),
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
