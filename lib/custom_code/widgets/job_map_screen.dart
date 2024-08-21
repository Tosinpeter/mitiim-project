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

import '/flutter_flow/flutter_flow_util.dart' as ff_util;
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;

class JobMapScreen extends StatefulWidget {
  const JobMapScreen({
    super.key,
    this.width,
    this.height,
    required this.listofdataset,
    required this.isjob,
    this.userlat,
    this.userlog,
  });

  final double? width;
  final double? height;
  final List<DocumentReference> listofdataset;
  final bool isjob;
  final String? userlat;
  final String? userlog;

  @override
  State<JobMapScreen> createState() => _JobMapScreenState();
}

class _JobMapScreenState extends State<JobMapScreen> {
  late google_maps.GoogleMapController _mapController;
  final Map<google_maps.MarkerId, google_maps.Marker> _markers = {};
  google_maps.CameraPosition? _initialCameraPosition;

  @override
  void initState() {
    super.initState();
    _setInitialCameraPosition();
    _setMarkers();
  }

  void _setInitialCameraPosition() {
    if (widget.userlat != null && widget.userlog != null) {
      final lat = double.tryParse(widget.userlat!);
      final log = double.tryParse(widget.userlog!);
      if (lat != null && log != null) {
        setState(() {
          _initialCameraPosition = google_maps.CameraPosition(
            target: google_maps.LatLng(lat, log),
            zoom: 14.0,
          );
        });
        return;
      }
    }

    // Default camera position if userlat and userlog are not provided
    _initialCameraPosition = const google_maps.CameraPosition(
      target: google_maps.LatLng(37.7749, -122.4194),
      zoom: 14.0,
    );
  }

  Future<void> _setMarkers() async {
    for (var docRef in widget.listofdataset) {
      final docSnapshot = await docRef.get();
      if (!docSnapshot.exists) {
        continue; // Skip if the document doesn't exist
      }
      final data = docSnapshot.data() as Map<String, dynamic>;
      final location = data['locations'] as String?;
      final price = data['price'];

      // Parse the location string
      if (location != null) {
        final latLng = _parseLocation(location);
        if (latLng != null) {
          final markerId = google_maps.MarkerId(docRef.id);
          final marker = google_maps.Marker(
            markerId: markerId,
            position: latLng,
            infoWindow: google_maps.InfoWindow(
              title: 'Price: $price',
            ),
            onTap: () {
              final pageName = widget.isjob ? 'bookService' : 'provider_apply';
              Navigator.pushNamed(
                context,
                pageName,
                arguments: {
                  'docRef': ff_util.serializeParam(
                      docRef, ff_util.ParamType.DocumentReference),
                },
              );
            },
          );
          setState(() {
            _markers[markerId] = marker;
          });
        }
      }
    }
  }

  google_maps.LatLng? _parseLocation(String location) {
    try {
      final parts = location.split(',');
      if (parts.length == 2) {
        final latitude = double.tryParse(parts[0].trim());
        final longitude = double.tryParse(parts[1].trim());
        if (latitude != null && longitude != null) {
          return google_maps.LatLng(latitude, longitude);
        }
      }
      return null;
    } catch (e) {
      print('Error parsing location: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_initialCameraPosition == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        body: google_maps.GoogleMap(
          initialCameraPosition: _initialCameraPosition!,
          markers: Set<google_maps.Marker>.of(_markers.values),
          onMapCreated: (google_maps.GoogleMapController controller) {
            _mapController = controller;
          },
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          myLocationEnabled:
              false, // Disable myLocationEnabled since we are not using location services
          compassEnabled: true,
          mapToolbarEnabled: true,
          trafficEnabled: true,
        ),
      );
    }
  }
}
