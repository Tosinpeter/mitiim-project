// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geo_firestore_flutter/geo_firestore_flutter.dart';

Future<List<PublishRecord>> getPublishedInRange(
    LatLng latLng, int kmRange) async {
  // Add your function code here!

  final queryLocation = GeoPoint(latLng.latitude, latLng.longitude);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  GeoFirestore geoFirestore = GeoFirestore(firestore.collection('publish'));

  List<PublishRecord> docs = [];

  // creates a new query around [37.7832, -122.4056] with a radius of 0.6 kilometers
  final List<DocumentSnapshot<Map<String, dynamic>>> documents =
      await geoFirestore.getAtLocation(queryLocation, 0.1 * kmRange);
  documents.forEach((document) {
    print(document.data());
    // docs.add(document.data()! as PublishRecord);
    PublishRecord pubRecord = PublishRecord.fromSnapshot(document);
    docs.add(pubRecord);
  });
  print(docs);
  return docs;
}
