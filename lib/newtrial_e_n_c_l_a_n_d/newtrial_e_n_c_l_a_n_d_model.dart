import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'newtrial_e_n_c_l_a_n_d_widget.dart' show NewtrialENCLANDWidget;
import 'package:flutter/material.dart';

class NewtrialENCLANDModel extends FlutterFlowModel<NewtrialENCLANDWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in ImagePickerView widget.
  UserAccountRecord? uploadImageENCLAND;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
