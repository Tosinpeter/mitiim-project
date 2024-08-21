import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'publish_rate_availability_widget.dart'
    show PublishRateAvailabilityWidget;
import 'package:flutter/material.dart';

class PublishRateAvailabilityModel
    extends FlutterFlowModel<PublishRateAvailabilityWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for dailyrate widget.
  FocusNode? dailyrateFocusNode;
  TextEditingController? dailyrateTextController;
  String? Function(BuildContext, String?)? dailyrateTextControllerValidator;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    dailyrateFocusNode?.dispose();
    dailyrateTextController?.dispose();
  }
}
