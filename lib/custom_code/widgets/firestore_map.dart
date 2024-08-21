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

import 'package:google_maps_flutter/google_maps_flutter.dart'
    as google_maps_flutter;
import '/flutter_flow/lat_lng.dart' as latlng;
import 'dart:async';
export 'dart:async' show Completer;
export 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
export '/flutter_flow/lat_lng.dart' show LatLng;
import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreMap extends StatefulWidget {
  const FirestoreMap({
    super.key,
    this.width,
    this.height,
    this.places,
    this.centerLatitude,
    this.centerLongitude,
    this.onclickMarker,
    this.icon,
  });

  final double? width;
  final double? height;
  final List<PublishRecord>? places;
  final double? centerLatitude;
  final double? centerLongitude;
  final Future Function(PublishRecord? placerow)? onclickMarker;
  final String? icon;

  @override
  State<FirestoreMap> createState() => _FirestoreMapState();
}

class _FirestoreMapState extends State<FirestoreMap> {}
