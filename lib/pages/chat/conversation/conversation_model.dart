import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'conversation_widget.dart' show ConversationWidget;
import 'package:flutter/material.dart';

class ConversationModel extends FlutterFlowModel<ConversationWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? messageRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
