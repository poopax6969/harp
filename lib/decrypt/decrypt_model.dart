import '/flutter_flow/flutter_flow_util.dart';
import 'decrypt_widget.dart' show DecryptWidget;
import 'package:flutter/material.dart';

class DecryptModel extends FlutterFlowModel<DecryptWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
