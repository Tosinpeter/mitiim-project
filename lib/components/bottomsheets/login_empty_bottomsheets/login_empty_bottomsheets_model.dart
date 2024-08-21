import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_empty_bottomsheets_widget.dart' show LoginEmptyBottomsheetsWidget;
import 'package:flutter/material.dart';

class LoginEmptyBottomsheetsModel
    extends FlutterFlowModel<LoginEmptyBottomsheetsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  UsersRecord? userdoc;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    emailTextController?.dispose();

    textFieldFocusNode2?.dispose();
    passwordTextController?.dispose();
  }
}
