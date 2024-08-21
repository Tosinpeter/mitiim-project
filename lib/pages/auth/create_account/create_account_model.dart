import '/flutter_flow/flutter_flow_util.dart';
import 'create_account_widget.dart' show CreateAccountWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateAccountModel extends FlutterFlowModel<CreateAccountWidget> {
  ///  Local state fields for this page.

  DateTime? datepicked;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for FirstName_company widget.
  FocusNode? firstNameCompanyFocusNode;
  TextEditingController? firstNameCompanyTextController;
  String? Function(BuildContext, String?)?
      firstNameCompanyTextControllerValidator;
  String? _firstNameCompanyTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'sx4z9l80' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for displayname widget.
  FocusNode? displaynameFocusNode;
  TextEditingController? displaynameTextController;
  String? Function(BuildContext, String?)? displaynameTextControllerValidator;
  String? _displaynameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '356espiy' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DateBirthday_company widget.
  FocusNode? dateBirthdayCompanyFocusNode;
  TextEditingController? dateBirthdayCompanyTextController;
  final dateBirthdayCompanyMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      dateBirthdayCompanyTextControllerValidator;
  String? _dateBirthdayCompanyTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'px03s0xq' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for Address_company widget.
  FocusNode? addressCompanyFocusNode;
  TextEditingController? addressCompanyTextController;
  String? Function(BuildContext, String?)?
      addressCompanyTextControllerValidator;
  String? _addressCompanyTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7496akno' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for city_company widget.
  FocusNode? cityCompanyFocusNode;
  TextEditingController? cityCompanyTextController;
  String? Function(BuildContext, String?)? cityCompanyTextControllerValidator;
  String? _cityCompanyTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'iwtk1fwf' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Phone_company widget.
  FocusNode? phoneCompanyFocusNode;
  TextEditingController? phoneCompanyTextController;
  String? Function(BuildContext, String?)? phoneCompanyTextControllerValidator;
  String? _phoneCompanyTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mib285dw' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g7f4v7r5' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Password_company widget.
  FocusNode? passwordCompanyFocusNode;
  TextEditingController? passwordCompanyTextController;
  late bool passwordCompanyVisibility;
  String? Function(BuildContext, String?)?
      passwordCompanyTextControllerValidator;
  String? _passwordCompanyTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fwovqgth' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    firstNameCompanyTextControllerValidator =
        _firstNameCompanyTextControllerValidator;
    displaynameTextControllerValidator = _displaynameTextControllerValidator;
    dateBirthdayCompanyTextControllerValidator =
        _dateBirthdayCompanyTextControllerValidator;
    addressCompanyTextControllerValidator =
        _addressCompanyTextControllerValidator;
    cityCompanyTextControllerValidator = _cityCompanyTextControllerValidator;
    phoneCompanyTextControllerValidator = _phoneCompanyTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    passwordCompanyVisibility = false;
    passwordCompanyTextControllerValidator =
        _passwordCompanyTextControllerValidator;
  }

  @override
  void dispose() {
    firstNameCompanyFocusNode?.dispose();
    firstNameCompanyTextController?.dispose();

    displaynameFocusNode?.dispose();
    displaynameTextController?.dispose();

    dateBirthdayCompanyFocusNode?.dispose();
    dateBirthdayCompanyTextController?.dispose();

    addressCompanyFocusNode?.dispose();
    addressCompanyTextController?.dispose();

    cityCompanyFocusNode?.dispose();
    cityCompanyTextController?.dispose();

    phoneCompanyFocusNode?.dispose();
    phoneCompanyTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordCompanyFocusNode?.dispose();
    passwordCompanyTextController?.dispose();
  }
}
