import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/publish_provider/user_filter_card/user_filter_card_widget.dart';
import 'filters_avis_client_widget.dart' show FiltersAvisClientWidget;
import 'package:flutter/material.dart';

class FiltersAvisClientModel extends FlutterFlowModel<FiltersAvisClientWidget> {
  ///  Local state fields for this page.

  List<PublishRecord> filteredPageData = [];
  void addToFilteredPageData(PublishRecord item) => filteredPageData.add(item);
  void removeFromFilteredPageData(PublishRecord item) =>
      filteredPageData.remove(item);
  void removeAtIndexFromFilteredPageData(int index) =>
      filteredPageData.removeAt(index);
  void insertAtIndexInFilteredPageData(int index, PublishRecord item) =>
      filteredPageData.insert(index, item);
  void updateFilteredPageDataAtIndex(
          int index, Function(PublishRecord) updateFn) =>
      filteredPageData[index] = updateFn(filteredPageData[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getPublishedInRange] action in Filters_avis_client widget.
  List<PublishRecord>? dataList;
  // Stores action output result for [Custom Action - getClientRecords] action in Filters_avis_client widget.
  List<PublishRecord>? clientsDataList;
  // Stores action output result for [Custom Action - advanceFilterClient] action in Filters_avis_client widget.
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
