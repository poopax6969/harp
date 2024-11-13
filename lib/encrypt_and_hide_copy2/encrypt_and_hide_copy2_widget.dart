import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:styled_divider/styled_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'encrypt_and_hide_copy2_model.dart';
export 'encrypt_and_hide_copy2_model.dart';

class EncryptAndHideCopy2Widget extends StatefulWidget {
  const EncryptAndHideCopy2Widget({super.key});

  @override
  State<EncryptAndHideCopy2Widget> createState() =>
      _EncryptAndHideCopy2WidgetState();
}

class _EncryptAndHideCopy2WidgetState extends State<EncryptAndHideCopy2Widget> {
  late EncryptAndHideCopy2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EncryptAndHideCopy2Model());

    _model.textController1 ??=
        TextEditingController(text: _model.textController2.text);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: _model.textController1.text);
    _model.textFieldFocusNode2 ??= FocusNode();

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
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 80.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 15.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 1.0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: SafeArea(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Container(
                              width: 200.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: Image.asset(
                                    'assets/images/icn2.png',
                                  ).image,
                                ),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 0.0,
                                ),
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(100.0, 100.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                          textColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          pickerFontFamily: 'commandFont',
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl =
                                                  downloadUrls.first;
                                            });
                                            showUploadMessage(
                                                context, 'Success!');
                                          } else {
                                            safeSetState(() {});
                                            showUploadMessage(context,
                                                'Failed to upload data');
                                            return;
                                          }
                                        }

                                        if (_model.uploadedFileUrl != ''
                                            ? (_model.uploadedFileUrl ==
                                                '${_model.uploadedFileUrl}${valueOrDefault<String>(
                                                  random_data.randomString(
                                                    10,
                                                    10,
                                                    true,
                                                    true,
                                                    true,
                                                  ),
                                                  '\$uploadPreEnc',
                                                )}.png')
                                            : (await getPermissionStatus(
                                                notificationsPermission))) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                '_uploadSuccessful',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .displayMedium
                                                    .override(
                                                      fontFamily: 'commandFont',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }
                                      },
                                      child: SizedBox(
                                        width: 100.0,
                                        height: 100.0,
                                        child: custom_widgets.ImagePickerView(
                                          width: 100.0,
                                          height: 100.0,
                                          onFilePicked: (picked) async {},
                                          onFileRemoved: (removed) async {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(29.0, 0.0, 29.0, 0.0),
                    child: Text(
                      '[]  ==  img.set_coverFile:  enctype/.PNG   ',
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'commandFont',
                                fontSize: 19.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: false,
                              ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 30.0, 25.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController1,
                      focusNode: _model.textFieldFocusNode1,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController1',
                        const Duration(milliseconds: 2000),
                        () => safeSetState(() {}),
                      ),
                      autofocus: true,
                      textInputAction: TextInputAction.done,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'commandFont',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 18.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w300,
                                  useGoogleFonts: false,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'commandFont',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w300,
                                  useGoogleFonts: false,
                                ),
                        errorStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'commandFont',
                                  color: FlutterFlowTheme.of(context).error,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'commandFont',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            useGoogleFonts: false,
                          ),
                      textAlign: TextAlign.start,
                      maxLines: 5,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      validator:
                          _model.textController1Validator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(29.0, 10.0, 29.0, 0.0),
                    child: Text(
                      '[ ]  == usr.setData  for  /aes.encrypt.                   ',
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'commandFont',
                                fontSize: 19.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: false,
                              ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 30.0, 25.0, 1.0),
                    child: TextFormField(
                      controller: _model.textController2,
                      focusNode: _model.textFieldFocusNode2,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController2',
                        const Duration(milliseconds: 2000),
                        () => safeSetState(() {}),
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'commandFont',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 18.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w300,
                                  useGoogleFonts: false,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'commandFont',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w300,
                                  useGoogleFonts: false,
                                  lineHeight: 4.0,
                                ),
                        errorStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'commandFont',
                                  color: FlutterFlowTheme.of(context).error,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'commandFont',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            useGoogleFonts: false,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      validator:
                          _model.textController2Validator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(29.0, 10.0, 29.0, 5.0),
                    child: Text(
                      '[ ]  ==  usr.setPass10 for  /lsb. extract         ',
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'commandFont',
                                fontSize: 19.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: false,
                              ),
                    ),
                  ),
                  StyledDivider(
                    height: 50.0,
                    thickness: 2.0,
                    indent: 25.0,
                    endIndent: 25.0,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    lineStyle: DividerLineStyle.dashed,
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.apiResponseENCHIDE = await EncHideFBCall.call(
                            data: valueOrDefault<String>(
                              _model.textController2.text,
                              '\$dataInputValue',
                            ),
                            passphrase: valueOrDefault<String>(
                              _model.textController1.text,
                              'passphraseInputValue',
                            ),
                            image: _model.uploadedFileUrl,
                          );

                          if ((_model.apiResponseENCHIDE?.statusCode ?? 200)
                                      .toString() !=
                                  '') {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text(getJsonField(
                                        (_model.apiResponseENCHIDE?.jsonBody ??
                                            ''),
                                        r'''$.message''',
                                      ).toString()),
                                      content: Text(valueOrDefault<String>(
                                        JsonsuccesStruct.maybeFromMap((_model
                                                    .apiResponseENCHIDE
                                                    ?.jsonBody ??
                                                ''))
                                            ?.downloadUrl,
                                        '\$[\'signed_url\']',
                                      )),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: const Text('Confirm'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            await launchURL(valueOrDefault<String>(
                              JsonsuccesStruct.maybeFromMap(
                                      (_model.apiResponseENCHIDE?.jsonBody ??
                                          ''))
                                  ?.downloadUrl,
                              'fail_url',
                            ));
                          }

                          safeSetState(() {});
                        },
                        text: '_encrypt',
                        options: FFButtonOptions(
                          height: 65.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0x0096B691),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'commandFont',
                                    color: const Color(0xB2DFEDEC),
                                    fontSize: 24.0,
                                    letterSpacing: 5.0,
                                    fontWeight: FontWeight.w300,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Color(0x8032CC35),
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        safeSetState(() {});
                      },
                      text: 'anon_login',
                      options: FFButtonOptions(
                        height: 52.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).customColor6,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'commandFont',
                              color: FlutterFlowTheme.of(context).primaryCLR,
                              fontSize: 24.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w300,
                              useGoogleFonts: false,
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).customColor5,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.3,
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            25.0, 5.0, 25.0, 0.0),
                        child: LinearPercentIndicator(
                          percent:
                              (_model.apiResponseENCHIDE?.statusCode ?? 200)
                                  .toDouble(),
                          width: 120.0,
                          lineHeight: 11.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).primary,
                          backgroundColor:
                              FlutterFlowTheme.of(context).accent4,
                          center: Text(
                            '0%',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'commandFont',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                          barRadius: const Radius.circular(2.0),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
                    child: Text(
                      '',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'commandFont',
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: false,
                              ),
                    ),
                  ),
                  if (valueOrDefault<bool>(
                    (_model.apiResponseENCHIDE?.jsonBody ?? '') != null,
                    false,
                  ))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: SelectionArea(
                          child: AutoSizeText(
                        (_model.apiResponseENCHIDE?.jsonBody ?? '').toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'commandFont',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                              useGoogleFonts: false,
                            ),
                      )),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: Text(
                      (_model.apiResponseENCHIDE?.jsonBody ?? '').toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'commandFont',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
