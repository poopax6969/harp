import '/flutter_flow/flutter_flow_util.dart';
import 'sign_u_p_widget.dart' show SignUPWidget;
import 'package:flutter/material.dart';

class SignUPModel extends FlutterFlowModel<SignUPWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailInputValue widget.
  FocusNode? emailInputValueFocusNode;
  TextEditingController? emailInputValueTextController;
  String? Function(BuildContext, String?)?
      emailInputValueTextControllerValidator;
  // State field(s) for usernameInputValue widget.
  FocusNode? usernameInputValueFocusNode;
  TextEditingController? usernameInputValueTextController;
  String? Function(BuildContext, String?)?
      usernameInputValueTextControllerValidator;
  // State field(s) for passwordInputValue widget.
  FocusNode? passwordInputValueFocusNode;
  TextEditingController? passwordInputValueTextController;
  late bool passwordInputValueVisibility;
  String? Function(BuildContext, String?)?
      passwordInputValueTextControllerValidator;
  // State field(s) for defaultPassphraseInput widget.
  FocusNode? defaultPassphraseInputFocusNode;
  TextEditingController? defaultPassphraseInputTextController;
  late bool defaultPassphraseInputVisibility;
  String? Function(BuildContext, String?)?
      defaultPassphraseInputTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordInputValueVisibility = false;
    defaultPassphraseInputVisibility = false;
  }

  @override
  void dispose() {
    emailInputValueFocusNode?.dispose();
    emailInputValueTextController?.dispose();

    usernameInputValueFocusNode?.dispose();
    usernameInputValueTextController?.dispose();

    passwordInputValueFocusNode?.dispose();
    passwordInputValueTextController?.dispose();

    defaultPassphraseInputFocusNode?.dispose();
    defaultPassphraseInputTextController?.dispose();
  }
}
