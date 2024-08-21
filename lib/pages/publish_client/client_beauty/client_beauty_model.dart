import '/components/button/publish_btn/publish_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'client_beauty_widget.dart' show ClientBeautyWidget;
import 'package:flutter/material.dart';

class ClientBeautyModel extends FlutterFlowModel<ClientBeautyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for other widget.
  FocusNode? otherFocusNode;
  TextEditingController? otherTextController;
  String? Function(BuildContext, String?)? otherTextControllerValidator;
  // State field(s) for desc widget.
  FocusNode? descFocusNode;
  TextEditingController? descTextController;
  String? Function(BuildContext, String?)? descTextControllerValidator;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  // Model for PublishBtn component.
  late PublishBtnModel publishBtnModel;

  @override
  void initState(BuildContext context) {
    publishBtnModel = createModel(context, () => PublishBtnModel());
  }

  @override
  void dispose() {
    otherFocusNode?.dispose();
    otherTextController?.dispose();

    descFocusNode?.dispose();
    descTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    publishBtnModel.dispose();
  }
}
