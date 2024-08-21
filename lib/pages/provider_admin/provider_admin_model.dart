import '/components/button/publish_btn_provider/publish_btn_provider_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'provider_admin_widget.dart' show ProviderAdminWidget;
import 'package:flutter/material.dart';

class ProviderAdminModel extends FlutterFlowModel<ProviderAdminWidget> {
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
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
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

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    publishBtnProviderModel.dispose();
  }
}
