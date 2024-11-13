import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'fresh2_model.dart';
export 'fresh2_model.dart';

class Fresh2Widget extends StatefulWidget {
  const Fresh2Widget({super.key});

  @override
  State<Fresh2Widget> createState() => _Fresh2WidgetState();
}

class _Fresh2WidgetState extends State<Fresh2Widget> {
  late Fresh2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Fresh2Model());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryText,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
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
                        width: 350.0,
                        height: 250.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 50.0, 20.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: true,
                        textInputAction: TextInputAction.done,
                        obscureText: !_model.passwordVisibility,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'commandFont',
                                color: FlutterFlowTheme.of(context).primaryCLR,
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
                                color: FlutterFlowTheme.of(context).primaryCLR,
                                fontSize: 22.0,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: false,
                                lineHeight: 3.0,
                              ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).customColor2,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).customColor4,
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryCLR,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).customColor3,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
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
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
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
                                    firebaseURL: _model.uploadedFileUrl2,
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
                          color: FlutterFlowTheme.of(context).primaryCLR,
                          textStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'commandFont',
                                color:
                                    FlutterFlowTheme.of(context).customColor10,
                                fontSize: 30.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: false,
                              ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).customColor2,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                          hoverColor: FlutterFlowTheme.of(context).customColor6,
                          hoverBorderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).customColor10,
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
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.apiResultzwl = await ExtractDecryptCall.call(
                            passphrase: _model.textController.text,
                            image: _model.uploadedFileUrl2,
                          );

                          if ((_model.apiResultzwl?.succeeded ?? true)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Decryption successful.',
                                  style: TextStyle(
                                    fontFamily: 'commandFont',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 30.0,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Decrypted data:'),
                                  content: Text(DecryptedStruct.maybeFromMap(
                                          (_model.apiResultzwl?.jsonBody ??
                                              ''))!
                                      .decryptedData),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          safeSetState(() {});
                        },
                        text: '_decrypt',
                        options: FFButtonOptions(
                          width: 160.0,
                          height: 65.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryCLR,
                          textStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'commandFont',
                                color:
                                    FlutterFlowTheme.of(context).customColor10,
                                fontSize: 30.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: false,
                              ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).customColor2,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                          hoverColor: FlutterFlowTheme.of(context).customColor6,
                          hoverBorderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).customColor10,
                            width: 2.0,
                          ),
                          hoverTextColor:
                              FlutterFlowTheme.of(context).customColor5,
                          hoverElevation: 2.0,
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
