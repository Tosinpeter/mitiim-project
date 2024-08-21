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

Future<List<PublishRecord>> getProviderRecords(
  List<PublishRecord> records,
) async {
  List<PublishRecord> clientRecords = [];
  List<PublishRecord> providerRecords = [];

  for (PublishRecord record in records) {
    if (record.publishedBy == PublishedBy.client) {
      clientRecords.add(record);
    } else if (record.publishedBy == PublishedBy.provider) {
      providerRecords.add(record);
    }
  }

  return providerRecords;
}
