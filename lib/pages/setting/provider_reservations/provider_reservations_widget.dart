import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/cards/reservation_card/reservation_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'provider_reservations_model.dart';
export 'provider_reservations_model.dart';

class ProviderReservationsWidget extends StatefulWidget {
  const ProviderReservationsWidget({
    super.key,
    this.publishDoc,
  });

  final PublishRecord? publishDoc;

  @override
  State<ProviderReservationsWidget> createState() =>
      _ProviderReservationsWidgetState();
}

class _ProviderReservationsWidgetState
    extends State<ProviderReservationsWidget> {
  late ProviderReservationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProviderReservationsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_ios,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'hrprossu' /* Réservations */,
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleLargeFamily),
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Builder(
              builder: (context) {
                if (widget.publishDoc == null) {
                  return StreamBuilder<List<PublishRecord>>(
                    stream: queryPublishRecord(
                      queryBuilder: (publishRecord) => publishRecord
                          .where(
                            'publishedBy',
                            isEqualTo: PublishedBy.provider.serialize(),
                          )
                          .where(
                            'uid',
                            isEqualTo: currentUserUid,
                          ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: LinearProgressIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        );
                      }
                      List<PublishRecord> columnPublishRecordList =
                          snapshot.data!;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(columnPublishRecordList.length,
                            (columnIndex) {
                          final columnPublishRecord =
                              columnPublishRecordList[columnIndex];
                          return ReservationCardWidget(
                            key: Key(
                                'Keyvwb_${columnIndex}_of_${columnPublishRecordList.length}'),
                            publishDoc: columnPublishRecord,
                          );
                        }),
                      );
                    },
                  );
                } else {
                  return wrapWithModel(
                    model: _model.reservationCardModel2,
                    updateCallback: () => setState(() {}),
                    child: ReservationCardWidget(
                      publishDoc: widget.publishDoc!,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
