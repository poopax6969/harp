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

Future<List<dynamic>> calculateImageHash(String imagePath) async {
  try {
    File imageFile = File(imagePath);

    if (await imageFile.exists()) {
      List<int> imageBytes = await imageFile.readAsBytes();

      var md5;
      var md5Checksum = md5.convert(imageBytes).toString();

      var sha256;
      var sha256Checksum = sha256.convert(imageBytes).toString();

      int fileSize = await imageFile.length();

      return [
        {
          'fileName': path.basename(imagePath),
          'fileSize': fileSize,
          'sha256Hash': sha256Checksum,
          'md5Checksum': md5Checksum,
        }
      ];
    } else {
      return [
        {'error': 'File not found: $imagePath'}
      ];
    }
  } catch (e) {
    return [
      {'error': 'An error occurred: $e'}
    ];
  }
}
