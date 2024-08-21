import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'publish_btn_provider_model.dart';
export 'publish_btn_provider_model.dart';

class PublishBtnProviderWidget extends StatefulWidget {
  const PublishBtnProviderWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    this.publishDoc,
    String? categoryName,
    required this.categoryImage,
  }) : categoryName = categoryName ?? ' ';

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;
  final String? parameter4;
  final String? parameter5;
  final PublishRecord? publishDoc;
  final String categoryName;
  final String? categoryImage;

  @override
  State<PublishBtnProviderWidget> createState() =>
      _PublishBtnProviderWidgetState();
}

class _PublishBtnProviderWidgetState extends State<PublishBtnProviderWidget> {
  late PublishBtnProviderModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublishBtnProviderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          currentUserLocationValue =
              await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
          var shouldSetState = false;
          _model.reverseGeoRes = await ReverseLatLngCall.call(
            lat: functions
                .convertLocation(currentUserLocationValue!)
                .first
                .toString(),
            lng: functions
                .convertLocation(currentUserLocationValue!)
                .last
                .toString(),
          );

          shouldSetState = true;
          if (ReverseLatLngCall.country(
                    (_model.reverseGeoRes?.jsonBody ?? ''),
                  ) !=
                  null &&
              ReverseLatLngCall.country(
                    (_model.reverseGeoRes?.jsonBody ?? ''),
                  ) !=
                  '') {
            await currentUserReference!.update(createUsersRecordData(
              state: ReverseLatLngCall.state(
                (_model.reverseGeoRes?.jsonBody ?? ''),
              ),
              country: ReverseLatLngCall.country(
                (_model.reverseGeoRes?.jsonBody ?? ''),
              ),
              countryCode: ReverseLatLngCall.countryCode(
                (_model.reverseGeoRes?.jsonBody ?? ''),
              ),
            ));
          }
          if (widget.publishDoc != null) {
            await widget.publishDoc!.reference.update(createPublishRecordData(
              name: widget.parameter1,
              description: widget.parameter3,
              other: widget.parameter2,
              hourlyRate: widget.parameter4,
              updatedAt: getCurrentTimestamp,
              locations: currentUserLocationValue?.toString(),
              dailyRate: widget.parameter5,
            ));
            await actions.addGeoPoint(
              widget.publishDoc!.reference,
              currentUserLocationValue!,
            );

            context.goNamed(
              'provider_address',
              queryParameters: {
                'publishDoc': serializeParam(
                  widget.publishDoc,
                  ParamType.Document,
                ),
                'categoryName': serializeParam(
                  widget.categoryName,
                  ParamType.String,
                ),
                'categoryImage': serializeParam(
                  widget.categoryImage,
                  ParamType.String,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'publishDoc': widget.publishDoc,
              },
            );

            if (shouldSetState) setState(() {});
            return;
          } else {
            var publishRecordReference = PublishRecord.collection.doc();
            await publishRecordReference.set({
              ...createPublishRecordData(
                name: widget.parameter1,
                description: widget.parameter3,
                category: FFAppState().selectedCategory,
                publishedBy: FFAppState().publishedBy,
                other: widget.parameter2,
                uid: currentUserUid,
                userRef: currentUserReference,
                hourlyRate: widget.parameter4,
                locations: currentUserLocationValue?.toString(),
                dailyRate: widget.parameter5,
              ),
              ...mapToFirestore(
                {
                  'created_at': FieldValue.serverTimestamp(),
                },
              ),
            });
            _model.publishRef = PublishRecord.getDocumentFromData({
              ...createPublishRecordData(
                name: widget.parameter1,
                description: widget.parameter3,
                category: FFAppState().selectedCategory,
                publishedBy: FFAppState().publishedBy,
                other: widget.parameter2,
                uid: currentUserUid,
                userRef: currentUserReference,
                hourlyRate: widget.parameter4,
                locations: currentUserLocationValue?.toString(),
                dailyRate: widget.parameter5,
              ),
              ...mapToFirestore(
                {
                  'created_at': DateTime.now(),
                },
              ),
            }, publishRecordReference);
            shouldSetState = true;

            await _model.publishRef!.reference.update(createPublishRecordData(
              id: _model.publishRef?.reference.id,
            ));
            await actions.addGeoPoint(
              _model.publishRef!.reference,
              currentUserLocationValue!,
            );

            context.goNamed(
              'provider_address',
              queryParameters: {
                'publishDoc': serializeParam(
                  _model.publishRef,
                  ParamType.Document,
                ),
                'categoryName': serializeParam(
                  widget.categoryName,
                  ParamType.String,
                ),
                'categoryImage': serializeParam(
                  widget.categoryImage,
                  ParamType.String,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'publishDoc': _model.publishRef,
              },
            );

            if (shouldSetState) setState(() {});
            return;
          }

          if (shouldSetState) setState(() {});
        },
        child: const FaIcon(
          FontAwesomeIcons.chevronCircleRight,
          color: Color(0xFF0072BB),
          size: 40.0,
        ),
      ),
    );
  }
}
