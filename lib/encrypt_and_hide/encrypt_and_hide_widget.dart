import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'encrypt_and_hide_model.dart';
export 'encrypt_and_hide_model.dart';

class EncryptAndHideWidget extends StatefulWidget {
  const EncryptAndHideWidget({super.key});

  @override
  State<EncryptAndHideWidget> createState() => _EncryptAndHideWidgetState();
}

class _EncryptAndHideWidgetState extends State<EncryptAndHideWidget> {
  late EncryptAndHideModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EncryptAndHideModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
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
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 100.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 15.0),
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
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          safeSetState(() => _model.isDataUploading1 = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          try {
                            showUploadMessage(
                              context,
                              'Uploading file...',
                              showLoading: true,
                            );
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();
                          } finally {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            _model.isDataUploading1 = false;
                          }
                          if (selectedUploadedFiles.length ==
                              selectedMedia.length) {
                            safeSetState(() {
                              _model.uploadedLocalFile1 =
                                  selectedUploadedFiles.first;
                            });
                            showUploadMessage(context, 'Success!');
                          } else {
                            safeSetState(() {});
                            showUploadMessage(context, 'Failed to upload data');
                            return;
                          }
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.memory(
                          _model.uploadedLocalFile1.bytes ??
                              Uint8List.fromList([]),
                          width: 293.0,
                          height: 286.0,
                          fit: BoxFit.cover,
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
                        const EdgeInsetsDirectional.fromSTEB(25.0, 30.0, 25.0, 1.0),
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
                        hintText: 'Enter data to encrypt...',
                        hintStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'commandFont',
                              color: FlutterFlowTheme.of(context).primaryCLR,
                              fontSize: 14.0,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w300,
                              useGoogleFonts: false,
                            ),
                        errorStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'commandFont',
                                  color: FlutterFlowTheme.of(context).error,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
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
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'commandFont',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w300,
                                  useGoogleFonts: false,
                                ),
                        hintText: 'Enter passphrase...',
                        hintStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'commandFont',
                              color: FlutterFlowTheme.of(context).primaryCLR,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w300,
                              useGoogleFonts: false,
                            ),
                        errorStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'commandFont',
                                  color: FlutterFlowTheme.of(context).error,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
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
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                          ),
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      validator:
                          _model.textController2Validator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        {
                          safeSetState(() => _model.isDataUploading2 = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];
                          var selectedFiles = <SelectedFile>[];
                          var downloadUrls = <String>[];
                          try {
                            showUploadMessage(
                              context,
                              'Uploading file...',
                              showLoading: true,
                            );
                            selectedUploadedFiles =
                                _model.uploadedLocalFile1.bytes!.isNotEmpty
                                    ? [_model.uploadedLocalFile1]
                                    : <FFUploadedFile>[];
                            selectedFiles = selectedFilesFromUploadedFiles(
                              selectedUploadedFiles,
                            );
                            downloadUrls = (await Future.wait(
                              selectedFiles.map(
                                (f) async =>
                                    await uploadData(f.storagePath, f.bytes),
                              ),
                            ))
                                .where((u) => u != null)
                                .map((u) => u!)
                                .toList();
                          } finally {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            _model.isDataUploading2 = false;
                          }
                          if (selectedUploadedFiles.length ==
                                  selectedFiles.length &&
                              downloadUrls.length == selectedFiles.length) {
                            safeSetState(() {
                              _model.uploadedLocalFile2 =
                                  selectedUploadedFiles.first;
                              _model.uploadedFileUrl2 = downloadUrls.first;
                            });
                            showUploadMessage(
                              context,
                              'Success!',
                            );
                          } else {
                            safeSetState(() {});
                            showUploadMessage(
                              context,
                              'Failed to upload file',
                            );
                            return;
                          }
                        }

                        var uploadImageRecordReference =
                            UploadImageRecord.createDoc(
                          currentUserReference!,
                          id: valueOrDefault<String>(
                            random_data.randomString(
                              10,
                              10,
                              true,
                              false,
                              true,
                            ),
                            'docIDString',
                          ),
                        );
                        await uploadImageRecordReference
                            .set(createUploadImageRecordData(
                          firebaseURL: _model.uploadedFileUrl2,
                        ));
                        _model.uploadedFirebaseURL =
                            UploadImageRecord.getDocumentFromData(
                                createUploadImageRecordData(
                                  firebaseURL: _model.uploadedFileUrl2,
                                ),
                                uploadImageRecordReference);

                        safeSetState(() {});
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/icn2.png',
                          width: 300.0,
                          height: 101.0,
                          fit: BoxFit.contain,
                        ),
                      ),
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 180.0,
                      child: CarouselSlider(
                        items: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 25.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  final user = await authManager
                                      .signInAnonymously(context);
                                  if (user == null) {
                                    return;
                                  }

                                  safeSetState(() {});

                                  context.goNamedAuth(
                                      'landingModeSELECT', context.mounted);
                                },
                                text: 'anon_login',
                                options: FFButtonOptions(
                                  height: 52.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).customColor6,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'commandFont',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryCLR,
                                        fontSize: 24.0,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.w300,
                                        useGoogleFonts: false,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor5,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 20.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  _model.apiResultbib2 =
                                      await EncHideFBCall.call(
                                    data: _model.textController1.text,
                                    passphrase: _model.textController2.text,
                                    image: _model.uploadedFileUrl2,
                                  );

                                  if ((_model.apiResultbib2?.succeeded ??
                                      true)) {
                                    await launchURL(valueOrDefault<String>(
                                      ResponseStruct.maybeFromMap(
                                              (_model.apiResultbib2?.jsonBody ??
                                                  ''))
                                          ?.downloadUrl,
                                      '\$.downloadURL',
                                    ));
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(
                                              ResponseStruct.maybeFromMap(
                                                      (_model.apiResultbib2
                                                              ?.jsonBody ??
                                                          ''))!
                                                  .downloadUrl),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                text: '_encrypt2',
                                options: FFButtonOptions(
                                  height: 65.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0x0096B691),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'commandFont',
                                        color: const Color(0xB2DFEDEC),
                                        fontSize: 24.0,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.w300,
                                        shadows: [
                                          Shadow(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            offset: const Offset(2.0, 2.0),
                                            blurRadius: 2.0,
                                          )
                                        ],
                                        useGoogleFonts: false,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Color(0x8032CC35),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 20.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  _model.apiResultbib =
                                      await EncHideFBCall.call(
                                    data: _model.textController1.text,
                                    passphrase: _model.textController2.text,
                                    image:
                                        _model.uploadedFirebaseURL?.firebaseURL,
                                  );

                                  if ((_model.apiResultbib?.succeeded ??
                                      true)) {
                                    await launchURL(valueOrDefault<String>(
                                      ResponseStruct.maybeFromMap(
                                              (_model.apiResultbib?.jsonBody ??
                                                  ''))
                                          ?.downloadUrl,
                                      '\$.downloadURL',
                                    ));
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(
                                              (_model.apiResultbib?.jsonBody ??
                                                      '')
                                                  .toString()),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
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
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'commandFont',
                                        color: const Color(0xB2DFEDEC),
                                        fontSize: 24.0,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.w300,
                                        shadows: [
                                          Shadow(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            offset: const Offset(2.0, 2.0),
                                            blurRadius: 2.0,
                                          )
                                        ],
                                        useGoogleFonts: false,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Color(0x8032CC35),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/ico4.png',
                                width: 300.0,
                                height: 250.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 20.0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: '_decrypt',
                                options: FFButtonOptions(
                                  height: 67.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'commandFont',
                                        color: FlutterFlowTheme.of(context)
                                            .customColor5,
                                        fontSize: 24.0,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.w300,
                                        useGoogleFonts: false,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor2,
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                        carouselController: _model.carouselController ??=
                            CarouselSliderController(),
                        options: CarouselOptions(
                          initialPage: 1,
                          viewportFraction: 0.5,
                          disableCenter: true,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.25,
                          enableInfiniteScroll: false,
                          scrollDirection: Axis.horizontal,
                          autoPlay: false,
                          onPageChanged: (index, _) =>
                              _model.carouselCurrentIndex = index,
                        ),
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
                  Container(
                    width: 306.0,
                    height: 167.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        '',
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 396.0,
                    height: 35.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFF070906),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: SelectionArea(
                          child: Text(
                        _model.uploadedFileUrl2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'commandFont',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                              useGoogleFonts: false,
                            ),
                      )),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 5.0),
                    child: SelectionArea(
                        child: Text(
                      (_model.apiResultbib?.bodyText ?? ''),
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
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await launchURL(ResponseStruct.maybeFromMap(
                                (_model.apiResultbib?.jsonBody ?? ''))!
                            .downloadUrl);
                      },
                      text: 'Launch',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFF070906),
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'commandFont',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  useGoogleFonts: false,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).customColor2,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
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
