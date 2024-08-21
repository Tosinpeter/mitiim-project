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

List<PublishRecord> advanceFilterProvider(List<PublishRecord> dataList) {
  List<PublishRecord> filteredData = [];

  // Retrieve filter values from the app state
  PriceFilterType? priceFilterType = FFAppState().priceFilterTypeProvider;
  PublishCategory? categoryFilter = FFAppState().categoryFilterProvider;
  int priceFilter = FFAppState().priceFilterProvider;

  // Filter data based on the selected filter type
  dataList.forEach((record) {
    if (priceFilterType == PriceFilterType.daily) {
      if (categoryFilter != null &&
          record.category == categoryFilter &&
          int.parse(record.dailyRate) <= priceFilter) {
        filteredData.add(record);
      } else if (categoryFilter == null &&
          int.parse(record.dailyRate) <= priceFilter) {
        filteredData.add(record);
      }
    } else {
      if (categoryFilter != null &&
          record.category == categoryFilter &&
          int.parse(record.hourlyRate) <= priceFilter) {
        filteredData.add(record);
      } else if (categoryFilter == null &&
          int.parse(record.hourlyRate) <= priceFilter) {
        filteredData.add(record);
      }
    }
  });

  return filteredData;
}
