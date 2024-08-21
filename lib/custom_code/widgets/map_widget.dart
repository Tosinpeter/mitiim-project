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
import '/flutter_flow/lat_lng.dart' as ff; // Import flutter_flow LatLng

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    this.width,
    this.height,
    required this.navigate,
    this.price,
    this.location,
  });

  final double? width;
  final double? height;
  final Future Function(DocumentReference? userRef) navigate;
  final String? price;
  final ff.LatLng? location;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Set<gm.Marker> markers = {};
  gm.GoogleMapController? controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchParametersAndInitialize();
  }

  Future<void> _fetchParametersAndInitialize() async {
    await Future.delayed(Duration(seconds: 2));

    if (widget.location != null) {
      _initializeMarker();
    }

    setState(() {
      isLoading = false;
    });
  }

  gm.LatLng _convertToGmLatLng(ff.LatLng location) {
    return gm.LatLng(location.latitude, location.longitude);
  }

  void _initializeMarker() {
    if (widget.location == null) return;

    final gm.LatLng gmLocation = _convertToGmLatLng(widget.location!);

    final labelMarker = LabelMarker(
      label: widget.price ?? 'N/A',
      markerId: gm.MarkerId('location_marker'),
      position: gmLocation,
      infoWindow: gm.InfoWindow(
        title: widget.price ?? 'N/A',
      ),
    );

    setState(() {
      markers.add(
        gm.Marker(
          markerId: labelMarker.markerId,
          position: labelMarker.position,
          infoWindow: labelMarker.infoWindow,
          icon: gm.BitmapDescriptor.defaultMarkerWithHue(
              gm.BitmapDescriptor.hueYellow),
        ),
      );
      isLoading = false; // Set loading to false after initialization
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (widget.location == null) {
      return Center(child: Text('Location not provided'));
    }

    return gm.GoogleMap(
      initialCameraPosition: gm.CameraPosition(
        target: _convertToGmLatLng(widget.location!),
        zoom: 12,
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
