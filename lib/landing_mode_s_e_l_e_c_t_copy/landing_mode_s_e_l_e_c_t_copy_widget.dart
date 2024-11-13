import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'landing_mode_s_e_l_e_c_t_copy_model.dart';
export 'landing_mode_s_e_l_e_c_t_copy_model.dart';

class LandingModeSELECTCopyWidget extends StatefulWidget {
  const LandingModeSELECTCopyWidget({super.key});

  @override
  State<LandingModeSELECTCopyWidget> createState() =>
      _LandingModeSELECTCopyWidgetState();
}

class _LandingModeSELECTCopyWidgetState
    extends State<LandingModeSELECTCopyWidget> {
  late LandingModeSELECTCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LandingModeSELECTCopyModel());

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(35.0, 40.0, 25.0, 80.0),
                    child: Text(
                      '_harp',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 200.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('landingModeSELECT');
                      },
                      text: '_anon_login',
                      options: FFButtonOptions(
                        width: 180.0,
                        height: 65.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0x00070906),
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
                          color: FlutterFlowTheme.of(context).primary,
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
