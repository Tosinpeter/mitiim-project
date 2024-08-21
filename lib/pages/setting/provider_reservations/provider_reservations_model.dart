import '/components/cards/reservation_card/reservation_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'provider_reservations_widget.dart' show ProviderReservationsWidget;
import 'package:flutter/material.dart';

class ProviderReservationsModel
    extends FlutterFlowModel<ProviderReservationsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ReservationCard component.
  late ReservationCardModel reservationCardModel2;

  @override
  void initState(BuildContext context) {
    reservationCardModel2 = createModel(context, () => ReservationCardModel());
  }

  @override
  void dispose() {
    reservationCardModel2.dispose();
  }
}
