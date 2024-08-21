// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:label_marker/label_marker.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  Set<gm.Marker> markers = {};
  gm.GoogleMapController? controller;

  @override
  void initState() {
    super.initState();
    _initializeMarkers();
  }

  void _initializeMarkers() {
    final staticMarkers = [
      {
        'position': gm.LatLng(37.7749, -122.4194), // San Francisco
        'title': 'San Francisco',
      },
      {
        'position': gm.LatLng(34.0522, -118.2437), // Los Angeles
        'title': 'Los Angeles',
      },
      {
        'position': gm.LatLng(40.7128, -74.0060), // New York
        'title': 'New Yarkkkk',
      },
      {
        'position': gm.LatLng(41.8781, -87.6298), // Chicago
        'title': 'Chicago',
      },
      {
        'position': gm.LatLng(47.6062, -122.3321), // Seattle
        'title': 'Seattle',
      },
    ];

    for (var marker in staticMarkers) {
      final labelMarker = LabelMarker(
        label: marker['title'] as String,
        markerId: gm.MarkerId(marker['title'] as String),
        position: marker['position'] as gm.LatLng,
        infoWindow: gm.InfoWindow(
          title: marker['title'] as String,
        ),
      );

      // Directly create gm.Marker using LabelMarker properties
      markers.add(
        gm.Marker(
          markerId: labelMarker.markerId,
          position: labelMarker.position,
          infoWindow: labelMarker.infoWindow,
          icon: gm.BitmapDescriptor.defaultMarker,
        ),
      );
    }
    // for (var marker in staticMarkers) {
    //   markers.add(gm.Marker(
    //     markerId: gm.MarkerId(marker['title'] as String),
    //     position: marker['position'] as gm.LatLng,
    //     infoWindow: gm.InfoWindow(
    //       title: marker['title'] as String,
    //       snippet: 'This is a snippet',
    //     ),
    //   ));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return gm.GoogleMap(
      initialCameraPosition: const gm.CameraPosition(
        target: gm.LatLng(37.7749, -122.4194),
        zoom: 5,
      ),
      markers: markers,
      onMapCreated: (mapController) {
        setState(() {
          controller = mapController;
        });
      },
    );
  }
}
