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

List<PublishRecord> filterPublishRecords(List<PublishRecord> dataList) {
  // Add your function code here!
  List<PublishRecord> filteredData = [];
  if (FFAppState().homeFilters.isEmpty) {
    return dataList;
  }
  filteredData = dataList
      .where((record) => FFAppState().homeFilters.contains(record.category))
      .toList();
  return filteredData;
}
