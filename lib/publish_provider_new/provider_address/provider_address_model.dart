import '/flutter_flow/flutter_flow_util.dart';
import 'provider_address_widget.dart' show ProviderAddressWidget;
import 'package:flutter/material.dart';

class ProviderAddressModel extends FlutterFlowModel<ProviderAddressWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    locationFocusNode?.dispose();
    locationTextController?.dispose();
  }
}
