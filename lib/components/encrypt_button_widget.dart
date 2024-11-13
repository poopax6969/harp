import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'encrypt_button_model.dart';
export 'encrypt_button_model.dart';

class EncryptButtonWidget extends StatefulWidget {
  const EncryptButtonWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final String? parameter1;
  final String? parameter2;

  @override
  State<EncryptButtonWidget> createState() => _EncryptButtonWidgetState();
}

class _EncryptButtonWidgetState extends State<EncryptButtonWidget> {
  late EncryptButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EncryptButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
      child: FFButtonWidget(
        onPressed: () async {
          _model.apiResultbib = await EncHideFBCall.call(
            data: widget.parameter1,
            passphrase: widget.parameter2,
            image: FFAppState().image,
          );

          safeSetState(() {});
        },
        text: '_encrypt',
        options: FFButtonOptions(
          height: 61.0,
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: const Color(0x0096B691),
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'commandFont',
                color: FlutterFlowTheme.of(context).customColor5,
                fontSize: 28.0,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
                useGoogleFonts: false,
              ),
          elevation: 1.0,
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primaryCLR,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }
}
