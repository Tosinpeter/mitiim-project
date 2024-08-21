import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'publish_btn_provider_widget.dart' show PublishBtnProviderWidget;
import 'package:flutter/material.dart';

class PublishBtnProviderModel
    extends FlutterFlowModel<PublishBtnProviderWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (reverseLatLng)] action in Icon widget.
  ApiCallResponse? reverseGeoRes;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  PublishRecord? publishRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
