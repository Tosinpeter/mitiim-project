import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profil_demande_annonce_widget.dart' show ProfilDemandeAnnonceWidget;
import 'package:flutter/material.dart';

class ProfilDemandeAnnonceModel
    extends FlutterFlowModel<ProfilDemandeAnnonceWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> chatUsers = [];
  void addToChatUsers(DocumentReference item) => chatUsers.add(item);
  void removeFromChatUsers(DocumentReference item) => chatUsers.remove(item);
  void removeAtIndexFromChatUsers(int index) => chatUsers.removeAt(index);
  void insertAtIndexInChatUsers(int index, DocumentReference item) =>
      chatUsers.insert(index, item);
  void updateChatUsersAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      chatUsers[index] = updateFn(chatUsers[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? res;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  PublishRecord? publishDocAction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
