import '/flutter_flow/flutter_flow_util.dart';
import 'audio_chat_demo_widget.dart' show AudioChatDemoWidget;
import 'package:flutter/material.dart';

class AudioChatDemoModel extends FlutterFlowModel<AudioChatDemoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
