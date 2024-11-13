import '/flutter_flow/flutter_flow_util.dart';
import 'sign_in_launch_widget.dart' show SignInLaunchWidget;
import 'package:flutter/material.dart';

class SignInLaunchModel extends FlutterFlowModel<SignInLaunchWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for defaultPassphraseInput widget.
  FocusNode? defaultPassphraseInputFocusNode1;
  TextEditingController? defaultPassphraseInputTextController1;
  String? Function(BuildContext, String?)?
      defaultPassphraseInputTextController1Validator;
  // State field(s) for defaultEmailValue widget.
  FocusNode? defaultEmailValueFocusNode;
  TextEditingController? defaultEmailValueTextController;
  String? Function(BuildContext, String?)?
      defaultEmailValueTextControllerValidator;
  // State field(s) for defaultPassphraseInput widget.
  FocusNode? defaultPassphraseInputFocusNode2;
  TextEditingController? defaultPassphraseInputTextController2;
  String? Function(BuildContext, String?)?
      defaultPassphraseInputTextController2Validator;
  // State field(s) for defaultPassphraseInput widget.
  FocusNode? defaultPassphraseInputFocusNode3;
  TextEditingController? defaultPassphraseInputTextController3;
  String? Function(BuildContext, String?)?
      defaultPassphraseInputTextController3Validator;
  // State field(s) for defaultPassphraseInput widget.
  FocusNode? defaultPassphraseInputFocusNode4;
  TextEditingController? defaultPassphraseInputTextController4;
  String? Function(BuildContext, String?)?
      defaultPassphraseInputTextController4Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    defaultPassphraseInputFocusNode1?.dispose();
    defaultPassphraseInputTextController1?.dispose();

    defaultEmailValueFocusNode?.dispose();
    defaultEmailValueTextController?.dispose();

    defaultPassphraseInputFocusNode2?.dispose();
    defaultPassphraseInputTextController2?.dispose();

    defaultPassphraseInputFocusNode3?.dispose();
    defaultPassphraseInputTextController3?.dispose();

    defaultPassphraseInputFocusNode4?.dispose();
    defaultPassphraseInputTextController4?.dispose();
  }
}
