import '/components/cards/user_card_job/user_card_job_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'favoris_widget.dart' show FavorisWidget;
import 'package:flutter/material.dart';

class FavorisModel extends FlutterFlowModel<FavorisWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for UserCardJob dynamic component.
  late FlutterFlowDynamicModels<UserCardJobModel> userCardJobModels;

  @override
  void initState(BuildContext context) {
    userCardJobModels = FlutterFlowDynamicModels(() => UserCardJobModel());
  }

  @override
  void dispose() {
    userCardJobModels.dispose();
  }
}
