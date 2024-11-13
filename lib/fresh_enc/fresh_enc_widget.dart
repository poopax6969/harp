import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'fresh_enc_model.dart';
export 'fresh_enc_model.dart';

class FreshEncWidget extends StatefulWidget {
  const FreshEncWidget({super.key});

  @override
  State<FreshEncWidget> createState() => _FreshEncWidgetState();
}

class _FreshEncWidgetState extends State<FreshEncWidget> {
  late FreshEncModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FreshEncModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryText,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(20.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryCLR,
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).secondary),
            automaticallyImplyLeading: true,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '   _encrypt_and_embed',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'commandFont',
                      color: const Color(0xE3000000),
                      fontSize: 25.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                      useGoogleFonts: false,
                    ),
              ),
              centerTitle: false,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 1.0,
                    child: Container(
                      width: 351.0,
                      height: 257.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryCLR,
                          width: 2.0,
                        ),
                      ),
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
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
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
                              showUploadMessage(
                                  context, 'Failed to upload data');
                              return;
                            }
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.memory(
                            _model.uploadedLocalFile1.bytes ??
                                Uint8List.fromList([]),
                            width: 350.0,
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: SizedBox(
                        width: 600.0,
                        child: TextFormField(
                          controller: _model.textController1,
                          focusNode: _model.textFieldFocusNode1,
                          autofocus: true,
                          obscureText: false,
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
                            hintText: 'Data to encrypt..',
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
                                  lineHeight: 5.0,
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
                            hoverColor:
                                FlutterFlowTheme.of(context).customColor8,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'commandFont',
                                color: FlutterFlowTheme.of(context).primaryCLR,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: false,
                              ),
                          textAlign: TextAlign.start,
                          maxLines: null,
                          cursorColor:
                              FlutterFlowTheme.of(context).customColor2,
                          validator: _model.textController1Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: SizedBox(
                        width: 600.0,
                        child: TextFormField(
                          controller: _model.textController2,
                          focusNode: _model.textFieldFocusNode2,
                          autofocus: true,
                          textInputAction: TextInputAction.done,
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
                                color: FlutterFlowTheme.of(context).primaryCLR,
                                size: 20.0,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryCLR,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                              ),
                          cursorColor:
                              FlutterFlowTheme.of(context).customColor3,
                          validator: _model.textController2Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: SizedBox(
                      width: 600.0,
                      height: 117.0,
                      child: CarouselSlider(
                        items: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.encDl = await actions.downloadFile2(
                                  EncHideFBCall.downloadURL(
                                    (_model.apiResultFRSH?.jsonBody ?? ''),
                                  )!,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Download successful',
                                      style: TextStyle(
                                        fontFamily: 'commandFont',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );

                                safeSetState(() {});
                              },
                              text: '_download',
                              options: FFButtonOptions(
                                width: 160.0,
                                height: 65.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primaryCLR,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'commandFont',
                                      color: FlutterFlowTheme.of(context)
                                          .customColor10,
                                      fontSize: 30.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(6.0),
                                hoverColor:
                                    FlutterFlowTheme.of(context).customColor6,
                                hoverBorderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryCLR,
                                  width: 2.0,
                                ),
                                hoverTextColor:
                                    FlutterFlowTheme.of(context).customColor5,
                                hoverElevation: 2.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  {
                                    safeSetState(
                                        () => _model.isDataUploading2 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];
                                    var selectedFiles = <SelectedFile>[];
                                    var downloadUrls = <String>[];
                                    try {
                                      showUploadMessage(
                                        context,
                                        'Uploading file...',
                                        showLoading: true,
                                      );
                                      selectedUploadedFiles = _model
                                              .uploadedLocalFile1
                                              .bytes!
                                              .isNotEmpty
                                          ? [_model.uploadedLocalFile1]
                                          : <FFUploadedFile>[];
                                      selectedFiles =
                                          selectedFilesFromUploadedFiles(
                                        selectedUploadedFiles,
                                      );
                                      downloadUrls = (await Future.wait(
                                        selectedFiles.map(
                                          (f) async => await uploadData(
                                              f.storagePath, f.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      _model.isDataUploading2 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedFiles.length &&
                                        downloadUrls.length ==
                                            selectedFiles.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile2 =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl2 =
                                            downloadUrls.first;
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
                                        1,
                                        10,
                                        true,
                                        false,
                                        false,
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
                                            firebaseURL:
                                                _model.uploadedFileUrl2,
                                          ),
                                          uploadImageRecordReference);

                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                text: '_upload',
                                options: FFButtonOptions(
                                  width: 160.0,
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
                                        fontSize: 30.0,
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
                                  hoverColor:
                                      FlutterFlowTheme.of(context).customColor6,
                                  hoverBorderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor10,
                                    width: 2.0,
                                  ),
                                  hoverTextColor:
                                      FlutterFlowTheme.of(context).customColor5,
                                  hoverElevation: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.apiResultFRSH = await EncHideFBCall.call(
                                  data: _model.textController1.text,
                                  passphrase: _model.textController2.text,
                                  image: _model.uploadedFileUrl2,
                                );

                                if ((_model.apiResultFRSH?.succeeded ?? true)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Encryption succesful.',
                                        style: TextStyle(
                                          fontFamily: 'commandFont',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  await launchURL(ResponseStruct.maybeFromMap(
                                          (_model.apiResultFRSH?.jsonBody ??
                                              ''))!
                                      .hasDownloadUrl()
                                      .toString());
                                }

                                safeSetState(() {});
                              },
                              text: '_encrypt',
                              options: FFButtonOptions(
                                width: 160.0,
                                height: 65.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primaryCLR,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'commandFont',
                                      color: FlutterFlowTheme.of(context)
                                          .customColor10,
                                      fontSize: 30.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(6.0),
                                hoverColor:
                                    FlutterFlowTheme.of(context).customColor6,
                                hoverBorderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryCLR,
                                  width: 2.0,
                                ),
                                hoverTextColor:
                                    FlutterFlowTheme.of(context).customColor5,
                                hoverElevation: 2.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                safeSetState(() {});
                                await launchURL(ResponseStruct.maybeFromMap(
                                        (_model.apiResultFRSH?.jsonBody ?? ''))!
                                    .downloadUrl);
                              },
                              text: '_get_image',
                              options: FFButtonOptions(
                                width: 160.0,
                                height: 65.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primaryCLR,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'commandFont',
                                      color: FlutterFlowTheme.of(context)
                                          .customColor10,
                                      fontSize: 300.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(6.0),
                                hoverColor:
                                    FlutterFlowTheme.of(context).customColor6,
                                hoverBorderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryCLR,
                                  width: 2.0,
                                ),
                                hoverTextColor:
                                    FlutterFlowTheme.of(context).customColor5,
                                hoverElevation: 2.0,
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
                          enableInfiniteScroll: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: false,
                          onPageChanged: (index, _) =>
                              _model.carouselCurrentIndex = index,
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
    );
  }
}
