import '/components/category_chip/category_chip_widget.dart';
import '/components/category_text/category_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_filter_card_widget.dart' show UserFilterCardWidget;
import 'package:flutter/material.dart';

class UserFilterCardModel extends FlutterFlowModel<UserFilterCardWidget> {
  ///  Local state fields for this component.

  bool favToggle = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for CategoryChip component.
  late CategoryChipModel categoryChipModel;
  // Model for CategoryText component.
  late CategoryTextModel categoryTextModel;

  @override
  void initState(BuildContext context) {
    categoryChipModel = createModel(context, () => CategoryChipModel());
    categoryTextModel = createModel(context, () => CategoryTextModel());
  }

  @override
  void dispose() {
    categoryChipModel.dispose();
    categoryTextModel.dispose();
  }
}
