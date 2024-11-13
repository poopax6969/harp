import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'landing_mode_s_e_l_e_c_t_model.dart';
export 'landing_mode_s_e_l_e_c_t_model.dart';

class LandingModeSELECTWidget extends StatefulWidget {
  const LandingModeSELECTWidget({super.key});

  @override
  State<LandingModeSELECTWidget> createState() =>
      _LandingModeSELECTWidgetState();
}

class _LandingModeSELECTWidgetState extends State<LandingModeSELECTWidget> {
  late LandingModeSELECTModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LandingModeSELECTModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: const Color(0xFF070906),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 2.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            35.0, 30.0, 25.0, 80.0),
                        child: Text(
                          '_harp',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'commandFont',
                                fontSize: 35.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 25.0, 5.0, 25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('fresh2');
                          },
                          text: '.extract/decrypt',
                          options: FFButtonOptions(
                            height: 45.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0x0096B691),
                            textStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'commandFont',
                                  color:
                                      FlutterFlowTheme.of(context).customColor5,
                                  fontSize: 28.0,
                                  letterSpacing: 6.0,
                                  fontWeight: FontWeight.w300,
                                  shadows: [
                                    const Shadow(
                                      color: Color(0xE344F90D),
                                      offset: Offset(-8.0, 50.0),
                                      blurRadius: 2.0,
                                    )
                                  ],
                                  useGoogleFonts: false,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Color(0x8032CC35),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 30.0, 10.0, 25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('fresh');
                          },
                          text: '.encrypt/embed',
                          options: FFButtonOptions(
                            height: 45.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0x0096B691),
                            textStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'commandFont',
                                  color:
                                      FlutterFlowTheme.of(context).customColor5,
                                  letterSpacing: 6.0,
                                  fontWeight: FontWeight.w300,
                                  shadows: [
                                    const Shadow(
                                      color: Color(0xE344F90D),
                                      offset: Offset(-20.0, 50.0),
                                      blurRadius: 1.9,
                                    )
                                  ],
                                  useGoogleFonts: false,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Color(0x8032CC35),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 30.0, 0.0, 25.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: '.get_checksum',
                          options: FFButtonOptions(
                            height: 45.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0x0096B691),
                            textStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'commandFont',
                                  color:
                                      FlutterFlowTheme.of(context).customColor5,
                                  letterSpacing: 6.0,
                                  fontWeight: FontWeight.w300,
                                  shadows: [
                                    const Shadow(
                                      color: Color(0xE344F90D),
                                      offset: Offset(-20.0, 50.0),
                                      blurRadius: 1.6,
                                    )
                                  ],
                                  useGoogleFonts: false,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Color(0x8032CC35),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 80.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {},
                      text: '_anon_login',
                      options: FFButtonOptions(
                        width: 180.0,
                        height: 65.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFF070906),
                        textStyle: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .override(
                              fontFamily: 'commandFont',
                              color: FlutterFlowTheme.of(context).customColor5,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                              useGoogleFonts: false,
                            ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).customColor5,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
