import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modify_btn_client_model.dart';
export 'modify_btn_client_model.dart';

class ModifyBtnClientWidget extends StatefulWidget {
  const ModifyBtnClientWidget({
    super.key,
    required this.publishDoc,
  });

  final PublishRecord? publishDoc;

  @override
  State<ModifyBtnClientWidget> createState() => _ModifyBtnClientWidgetState();
}

class _ModifyBtnClientWidgetState extends State<ModifyBtnClientWidget> {
  late ModifyBtnClientModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModifyBtnClientModel());

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
            context.pushNamed(
              'client_catering',
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
            if (widget.publishDoc?.category == PublishCategory.HomeHelp) {
              context.pushNamed(
                'client_homehelp',
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
                  'client_beauty',
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
                    'client_it_service',
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
                      'client_lesson',
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
                        PublishCategory.Administrative) {
                      context.pushNamed(
                        'client_admin',
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
                          'client_construction',
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
                            'client_demenagement',
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
                              'client_auto',
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
          'ocs59wg0' /* Modifiez */,
        ),
        options: FFButtonOptions(
          width: double.infinity,
          height: 30.0,
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: const Color(0xFFDADADA),
          textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
              ),
          elevation: 0.0,
          borderSide: const BorderSide(
            color: Color(0x00FFFFFF),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
