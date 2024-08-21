import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'select_qualification_widget.dart' show SelectQualificationWidget;
import 'package:flutter/material.dart';

class SelectQualificationModel
    extends FlutterFlowModel<SelectQualificationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DDQualification widget.
  String? dDQualificationValue;
  FormFieldController<String>? dDQualificationValueController;
  // State field(s) for Ifotherspecify widget.
  FocusNode? ifotherspecifyFocusNode;
  TextEditingController? ifotherspecifyTextController;
  String? Function(BuildContext, String?)?
      ifotherspecifyTextControllerValidator;
  // State field(s) for skills widget.
  FocusNode? skillsFocusNode;
  TextEditingController? skillsTextController;
  String? Function(BuildContext, String?)? skillsTextControllerValidator;
  // State field(s) for Dailyrate widget.
  FocusNode? dailyrateFocusNode;
  TextEditingController? dailyrateTextController;
  String? Function(BuildContext, String?)? dailyrateTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ifotherspecifyFocusNode?.dispose();
    ifotherspecifyTextController?.dispose();

    skillsFocusNode?.dispose();
    skillsTextController?.dispose();

    dailyrateFocusNode?.dispose();
    dailyrateTextController?.dispose();
  }
}
