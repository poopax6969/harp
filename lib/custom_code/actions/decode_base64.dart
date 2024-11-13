// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as path;

Future<String?> decodeBase64(String input) async {
  try {
    List<int> decodedBytes = base64.decode(input);
    String decodedString = utf8.decode(decodedBytes);
    return decodedString;
  } catch (e) {
    print('Error decoding Base64: $e');
    return null;
  }
}
