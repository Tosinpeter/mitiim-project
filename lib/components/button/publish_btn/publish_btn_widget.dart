import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'publish_btn_model.dart';
export 'publish_btn_model.dart';

class PublishBtnWidget extends StatefulWidget {
  const PublishBtnWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.publishDoc,
    this.cateogryName,
    required this.categoryImage,
  });

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;
  final String? parameter4;
  final PublishRecord? publishDoc;
  final String? cateogryName;
  final String? categoryImage;

  @override
  State<PublishBtnWidget> createState() => _PublishBtnWidgetState();
}

class _PublishBtnWidgetState extends State<PublishBtnWidget> {
  late PublishBtnModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublishBtnModel());

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
              price: int.tryParse(widget.parameter4 ?? ''),
              other: widget.parameter2,
              updatedAt: getCurrentTimestamp,
              locations: currentUserLocationValue?.toString(),
            ));
            await actions.addGeoPoint(
              widget.publishDoc!.reference,
              currentUserLocationValue!,
            );

            context.goNamed(
              'client_address',
              queryParameters: {
                'publishDoc': serializeParam(
                  widget.publishDoc,
                  ParamType.Document,
                ),
                'categoryName': serializeParam(
                  widget.cateogryName,
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
                price: int.tryParse(widget.parameter4 ?? ''),
                category: FFAppState().selectedCategory,
                publishedBy: FFAppState().publishedBy,
                other: widget.parameter2,
                uid: currentUserUid,
                userRef: currentUserReference,
                locations: currentUserLocationValue?.toString(),
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
                price: int.tryParse(widget.parameter4 ?? ''),
                category: FFAppState().selectedCategory,
                publishedBy: FFAppState().publishedBy,
                other: widget.parameter2,
                uid: currentUserUid,
                userRef: currentUserReference,
                locations: currentUserLocationValue?.toString(),
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
              'client_address',
              queryParameters: {
                'publishDoc': serializeParam(
                  widget.publishDoc,
                  ParamType.Document,
                ),
                'categoryName': serializeParam(
                  widget.cateogryName,
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
