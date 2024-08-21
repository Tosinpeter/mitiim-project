import '/backend/backend.dart';
import '/components/cards/user_card_job/user_card_job_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  List<PublishRecord> pageDataList = [];
  void addToPageDataList(PublishRecord item) => pageDataList.add(item);
  void removeFromPageDataList(PublishRecord item) => pageDataList.remove(item);
  void removeAtIndexFromPageDataList(int index) => pageDataList.removeAt(index);
  void insertAtIndexInPageDataList(int index, PublishRecord item) =>
      pageDataList.insert(index, item);
  void updatePageDataListAtIndex(int index, Function(PublishRecord) updateFn) =>
      pageDataList[index] = updateFn(pageDataList[index]);

  List<PublishRecord> providerRecords = [];
  void addToProviderRecords(PublishRecord item) => providerRecords.add(item);
  void removeFromProviderRecords(PublishRecord item) =>
      providerRecords.remove(item);
  void removeAtIndexFromProviderRecords(int index) =>
      providerRecords.removeAt(index);
  void insertAtIndexInProviderRecords(int index, PublishRecord item) =>
      providerRecords.insert(index, item);
  void updateProviderRecordsAtIndex(
          int index, Function(PublishRecord) updateFn) =>
      providerRecords[index] = updateFn(providerRecords[index]);

  List<PublishRecord> clientRecords = [];
  void addToClientRecords(PublishRecord item) => clientRecords.add(item);
  void removeFromClientRecords(PublishRecord item) =>
      clientRecords.remove(item);
  void removeAtIndexFromClientRecords(int index) =>
      clientRecords.removeAt(index);
  void insertAtIndexInClientRecords(int index, PublishRecord item) =>
      clientRecords.insert(index, item);
  void updateClientRecordsAtIndex(
          int index, Function(PublishRecord) updateFn) =>
      clientRecords[index] = updateFn(clientRecords[index]);

  bool toggleMenu = true;

  String? price = '';

  String menu = 'job';

  LatLng? latlong;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getPublishedInRange] action in Home widget.
  List<PublishRecord>? dataList;
  // Stores action output result for [Custom Action - filterPublishRecords] action in Home widget.
  List<PublishRecord>? filteredDataList;
  // Stores action output result for [Custom Action - getClientRecords] action in Home widget.
  List<PublishRecord>? clientRecordsAction;
  // Stores action output result for [Custom Action - getProviderRecords] action in Home widget.
  List<PublishRecord>? providerRecordsAction;
  // Models for UserCardJob dynamic component.
  late FlutterFlowDynamicModels<UserCardJobModel> userCardJobModels;

  @override
  void initState(BuildContext context) {
    userCardJobModels = FlutterFlowDynamicModels(() => UserCardJobModel());
  }

  @override
  void dispose() {
    userCardJobModels.dispose();
  }

  /// Action blocks.
  Future filterBlock(BuildContext context) async {
    List<PublishRecord>? filteredDataListCopy;
    List<PublishRecord>? clientRecordsActionCopy;
    List<PublishRecord>? providerRecordsActionCopy;

    filteredDataListCopy = actions.filterPublishRecords(
      pageDataList.toList(),
    );
    clientRecordsActionCopy = await actions.getClientRecords(
      filteredDataListCopy.toList(),
    );
    providerRecordsActionCopy = await actions.getProviderRecords(
      filteredDataListCopy.toList(),
    );
    providerRecords = providerRecordsActionCopy.toList().cast<PublishRecord>();
    clientRecords = clientRecordsActionCopy.toList().cast<PublishRecord>();
  }
}
