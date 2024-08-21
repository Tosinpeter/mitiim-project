import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/publish_provider/user_filter_card/user_filter_card_widget.dart';
import 'filters_avis_provider_widget.dart' show FiltersAvisProviderWidget;
import 'package:flutter/material.dart';

class FiltersAvisProviderModel
    extends FlutterFlowModel<FiltersAvisProviderWidget> {
  ///  Local state fields for this page.

  List<PublishRecord> filteredDataPage = [];
  void addToFilteredDataPage(PublishRecord item) => filteredDataPage.add(item);
  void removeFromFilteredDataPage(PublishRecord item) =>
      filteredDataPage.remove(item);
  void removeAtIndexFromFilteredDataPage(int index) =>
      filteredDataPage.removeAt(index);
  void insertAtIndexInFilteredDataPage(int index, PublishRecord item) =>
      filteredDataPage.insert(index, item);
  void updateFilteredDataPageAtIndex(
          int index, Function(PublishRecord) updateFn) =>
      filteredDataPage[index] = updateFn(filteredDataPage[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getPublishedInRange] action in Filters_avis_provider widget.
  List<PublishRecord>? dataList;
  // Stores action output result for [Custom Action - getProviderRecords] action in Filters_avis_provider widget.
  List<PublishRecord>? providerDataList;
  // Stores action output result for [Custom Action - advanceFilterProvider] action in Filters_avis_provider widget.
  List<PublishRecord>? filteredData;
  // Models for UserFilterCard dynamic component.
  late FlutterFlowDynamicModels<UserFilterCardModel> userFilterCardModels;

  @override
  void initState(BuildContext context) {
    userFilterCardModels =
        FlutterFlowDynamicModels(() => UserFilterCardModel());
  }

  @override
  void dispose() {
    userFilterCardModels.dispose();
  }
}
