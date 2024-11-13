import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'bodytext_model.dart';
export 'bodytext_model.dart';

class BodytextWidget extends StatefulWidget {
  const BodytextWidget({
    super.key,
    String? parameter1,
  }) : parameter1 = parameter1 ?? 'body';

  final String parameter1;

  @override
  State<BodytextWidget> createState() => _BodytextWidgetState();
}

class _BodytextWidgetState extends State<BodytextWidget> {
  late BodytextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodytextModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
        child: AnimatedDefaultTextStyle(
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'commandFont',
            letterSpacing: 0.0,
            fontWeight: FontWeight.w300,
            useGoogleFonts: false,
          ),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeIn,
      child: Text(
        widget.parameter1,
      ),
    ));
  }
}
