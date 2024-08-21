import '/backend/backend.dart';
import '/components/category_chip/category_chip_widget.dart';
import '/components/category_text/category_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'book_service_widget.dart' show BookServiceWidget;
import 'package:flutter/material.dart';

class BookServiceModel extends FlutterFlowModel<BookServiceWidget> {
  ///  Local state fields for this page.

  bool mon = true;

  bool tue = true;

  bool wed = true;

  bool thu = true;

  bool fri = true;

  bool sat = true;

  bool sun = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for CategoryChip component.
  late CategoryChipModel categoryChipModel;
  // Model for CategoryText component.
  late CategoryTextModel categoryTextModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationRecord? notif;

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
