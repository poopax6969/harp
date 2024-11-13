import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _dataInputValue = '';
  String get dataInputValue => _dataInputValue;
  set dataInputValue(String value) {
    _dataInputValue = value;
  }

  String _image = '';
  String get image => _image;
  set image(String value) {
    _image = value;
  }

  String _downloadURL = '\$.downloadURL';
  String get downloadURL => _downloadURL;
  set downloadURL(String value) {
    _downloadURL = value;
  }

  String _passwordInputValue = '';
  String get passwordInputValue => _passwordInputValue;
  set passwordInputValue(String value) {
    _passwordInputValue = value;
  }

  String _downloadURLString = '\$.downloadURL';
  String get downloadURLString => _downloadURLString;
  set downloadURLString(String value) {
    _downloadURLString = value;
  }
}
