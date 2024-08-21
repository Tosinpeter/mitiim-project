import '/backend/backend.dart';
import '/components/category_chip/category_chip_widget.dart';
import '/components/category_text/category_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profil_reponse_annonce_widget.dart' show ProfilReponseAnnonceWidget;
import 'package:flutter/material.dart';

class ProfilReponseAnnonceModel
    extends FlutterFlowModel<ProfilReponseAnnonceWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for CategoryChip component.
  late CategoryChipModel categoryChipModel;
  // Model for CategoryText component.
  late CategoryTextModel categoryTextModel;
  // Stores action output result for [Backend Call - Read Document] action in Image widget.
  PublishRecord? publishDocAction;

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
