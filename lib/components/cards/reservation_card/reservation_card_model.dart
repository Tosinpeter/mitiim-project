import '/components/button/modify_btn_client/modify_btn_client_widget.dart';
import '/components/button/modify_btn_provider/modify_btn_provider_widget.dart';
import '/components/category_chip/category_chip_widget.dart';
import '/components/category_text/category_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reservation_card_widget.dart' show ReservationCardWidget;
import 'package:flutter/material.dart';

class ReservationCardModel extends FlutterFlowModel<ReservationCardWidget> {
  ///  Local state fields for this component.

  bool mon = true;

  bool tue = true;

  bool wed = true;

  bool thu = true;

  bool fri = true;

  bool sat = true;

  bool sun = true;

  ///  State fields for stateful widgets in this component.

  // Model for CategoryChip component.
  late CategoryChipModel categoryChipModel;
  // Model for CategoryText component.
  late CategoryTextModel categoryTextModel;
  // Model for ModifyBtnProvider component.
  late ModifyBtnProviderModel modifyBtnProviderModel;
  // Model for ModifyBtnClient component.
  late ModifyBtnClientModel modifyBtnClientModel;

  @override
  void initState(BuildContext context) {
    categoryChipModel = createModel(context, () => CategoryChipModel());
    categoryTextModel = createModel(context, () => CategoryTextModel());
    modifyBtnProviderModel =
        createModel(context, () => ModifyBtnProviderModel());
    modifyBtnClientModel = createModel(context, () => ModifyBtnClientModel());
  }

  @override
  void dispose() {
    categoryChipModel.dispose();
    categoryTextModel.dispose();
    modifyBtnProviderModel.dispose();
    modifyBtnClientModel.dispose();
  }
}
