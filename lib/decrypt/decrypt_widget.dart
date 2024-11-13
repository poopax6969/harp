import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'decrypt_model.dart';
export 'decrypt_model.dart';

class DecryptWidget extends StatefulWidget {
  const DecryptWidget({
    super.key,
    required this.downloadURL,
  });

  final ResponseStruct? downloadURL;

  @override
  State<DecryptWidget> createState() => _DecryptWidgetState();
}

class _DecryptWidgetState extends State<DecryptWidget> {
  late DecryptModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DecryptModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 1440.0,
                  height: 721.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF030403),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).secondary,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          valueOrDefault<String>(
                            getJsonField(
                              widget.downloadURL?.toMap(),
                              r'''$.downloadURL''',
                            )?.toString(),
                            '\$downloadURL',
                          ),
                          width: 586.0,
                          height: 344.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 866.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            obscureText: !_model.passwordVisibility,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'commandFont',
                                    color:
                                        FlutterFlowTheme.of(context).primaryCLR,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    useGoogleFonts: false,
                                  ),
                              hintText: 'Passphrase..',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'commandFont',
                                    color:
                                        FlutterFlowTheme.of(context).primaryCLR,
                                    fontSize: 22.0,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.w300,
                                    useGoogleFonts: false,
                                    lineHeight: 3.0,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor4,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 35.0, 0.0),
                              suffixIcon: InkWell(
                                onTap: () => safeSetState(
                                  () => _model.passwordVisibility =
                                      !_model.passwordVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryCLR,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).primaryCLR,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).customColor3,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: GridView(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 2.0,
                              childAspectRatio: 1.0,
                            ),
                            scrollDirection: Axis.vertical,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'anon_login',
                                  options: FFButtonOptions(
                                    width: 120.0,
                                    height: 65.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).primaryCLR,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily: 'commandFont',
                                          color: FlutterFlowTheme.of(context)
                                              .customColor10,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          useGoogleFonts: false,
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor2,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'anon_login',
                                  options: FFButtonOptions(
                                    width: 120.0,
                                    height: 65.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).primaryCLR,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily: 'commandFont',
                                          color: FlutterFlowTheme.of(context)
                                              .customColor10,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          useGoogleFonts: false,
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor2,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
