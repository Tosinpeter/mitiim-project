import '/components/category_chip/category_chip_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'filters_widget.dart' show FiltersWidget;
import 'package:flutter/material.dart';

class FiltersModel extends FlutterFlowModel<FiltersWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for CategoryChip component.
  late CategoryChipModel categoryChipModel1;
  // Model for CategoryChip component.
  late CategoryChipModel categoryChipModel2;

  @override
  void initState(BuildContext context) {
    categoryChipModel1 = createModel(context, () => CategoryChipModel());
    categoryChipModel2 = createModel(context, () => CategoryChipModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    categoryChipModel1.dispose();
    categoryChipModel2.dispose();
  }
}
