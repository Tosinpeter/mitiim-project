import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modify_btn_provider_model.dart';
export 'modify_btn_provider_model.dart';

class ModifyBtnProviderWidget extends StatefulWidget {
  const ModifyBtnProviderWidget({
    super.key,
    required this.publishDoc,
  });

  final PublishRecord? publishDoc;

  @override
  State<ModifyBtnProviderWidget> createState() =>
      _ModifyBtnProviderWidgetState();
}

class _ModifyBtnProviderWidgetState extends State<ModifyBtnProviderWidget> {
  late ModifyBtnProviderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModifyBtnProviderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
      child: FFButtonWidget(
        onPressed: () async {
          if (widget.publishDoc?.category == PublishCategory.Catering) {
            context.pushNamed('provider_catering');
          } else {
            if (widget.publishDoc?.category == PublishCategory.HomeHelp) {
              context.pushNamed(
                'provider_homehelp',
                queryParameters: {
                  'publishDoc': serializeParam(
                    widget.publishDoc,
                    ParamType.Document,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'publishDoc': widget.publishDoc,
                },
              );
            } else {
              if (widget.publishDoc?.category == PublishCategory.Beauty) {
                context.pushNamed(
                  'provider_beauty',
                  queryParameters: {
                    'publishDoc': serializeParam(
                      widget.publishDoc,
                      ParamType.Document,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'publishDoc': widget.publishDoc,
                  },
                );
              } else {
                if (widget.publishDoc?.category == PublishCategory.IT) {
                  context.pushNamed(
                    'provider_it_services',
                    queryParameters: {
                      'publishDoc': serializeParam(
                        widget.publishDoc,
                        ParamType.Document,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'publishDoc': widget.publishDoc,
                    },
                  );
                } else {
                  if (widget.publishDoc?.category ==
                      PublishCategory.PrivateLessons) {
                    context.pushNamed(
                      'provider_lesson',
                      queryParameters: {
                        'publshDoc': serializeParam(
                          widget.publishDoc,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'publshDoc': widget.publishDoc,
                      },
                    );
                  } else {
                    if (widget.publishDoc?.category ==
                        PublishCategory.Administrative) {
                      context.pushNamed(
                        'provider_admin',
                        queryParameters: {
                          'publishDoc': serializeParam(
                            widget.publishDoc,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'publishDoc': widget.publishDoc,
                        },
                      );
                    } else {
                      if (widget.publishDoc?.category ==
                          PublishCategory.Construction) {
                        context.pushNamed(
                          'selectQualification',
                          queryParameters: {
                            'publishDoc': serializeParam(
                              widget.publishDoc,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'publishDoc': widget.publishDoc,
                          },
                        );
                      } else {
                        if (widget.publishDoc?.category ==
                            PublishCategory.MovingAssembly) {
                          context.pushNamed(
                            'provider_demenagement',
                            queryParameters: {
                              'publishDoc': serializeParam(
                                widget.publishDoc,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'publishDoc': widget.publishDoc,
                            },
                          );
                        } else {
                          if (widget.publishDoc?.category ==
                              PublishCategory.Delivery) {
                            context.pushNamed(
                              'provider_auto',
                              queryParameters: {
                                'publishDoc': serializeParam(
                                  widget.publishDoc,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'publishDoc': widget.publishDoc,
                              },
                            );
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        text: FFLocalizations.of(context).getText(
          'fr6qi0i0' /* Modifiez */,
        ),
        options: FFButtonOptions(
          width: double.infinity,
          height: 30.0,
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: FlutterFlowTheme.of(context).primaryBackground,
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 16.0,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
              ),
          elevation: 0.0,
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).secondaryText,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
