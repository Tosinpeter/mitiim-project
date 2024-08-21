import '/components/button/publish_btn/publish_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'client_catering_widget.dart' show ClientCateringWidget;
import 'package:flutter/material.dart';

class ClientCateringModel extends FlutterFlowModel<ClientCateringWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for other widget.
  FocusNode? otherFocusNode;
  TextEditingController? otherTextController;
  String? Function(BuildContext, String?)? otherTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
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

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    publishBtnModel.dispose();
  }
}
