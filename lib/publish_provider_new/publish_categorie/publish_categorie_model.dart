import '/flutter_flow/flutter_flow_util.dart';
import 'publish_categorie_widget.dart' show PublishCategorieWidget;
import 'package:flutter/material.dart';

class PublishCategorieModel extends FlutterFlowModel<PublishCategorieWidget> {
  ///  Local state fields for this page.

  String category = 'unset';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
