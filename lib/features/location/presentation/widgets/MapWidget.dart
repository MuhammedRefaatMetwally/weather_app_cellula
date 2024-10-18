import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

import '../../domain/LocationEntity.dart';


class MapWidget extends StatelessWidget {
  final LocationEntity location;


  const MapWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,  // Adjust height based on screen size
      margin: const EdgeInsets.all(24),                      // Responsive margins
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),        // Rounded corners with responsive radius
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(
              location.latitude,  // Use latitude directly as a double
              location.longitude, // Use longitude directly as a double
            ),
            initialZoom: 13,                              // Initial zoom level
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',     // User agent package name for OpenStreetMap
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(
                    location.latitude,  // Use latitude directly as a double
                    location.longitude, // Use longitude directly as a double
                  ),
                  width: 80,                               // Responsive marker width
                  height: 80,                              // Responsive marker height
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.red,                       // Marker icon color
                    size: 40,                              // Responsive icon size
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}

