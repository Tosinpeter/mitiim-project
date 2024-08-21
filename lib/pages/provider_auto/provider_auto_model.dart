import '/components/button/publish_btn_provider/publish_btn_provider_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'provider_auto_widget.dart' show ProviderAutoWidget;
import 'package:flutter/material.dart';

class ProviderAutoModel extends FlutterFlowModel<ProviderAutoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Model for PublishBtnProvider component.
  late PublishBtnProviderModel publishBtnProviderModel;

  @override
  void initState(BuildContext context) {
    publishBtnProviderModel =
        createModel(context, () => PublishBtnProviderModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    publishBtnProviderModel.dispose();
  }
}
