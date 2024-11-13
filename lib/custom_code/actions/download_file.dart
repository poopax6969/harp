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

import 'package:open_file/open_file.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> downloadFile(String? fileName) async {
  if (fileName == null || fileName.isEmpty) {
    return Future.error('File name is null or empty');
  }

  try {
    final response =
        await http.get(Uri.parse('https://your-api.com/image/$fileName'));

    if (response.statusCode != 200) {
      return Future.error('Failed to download file: ${response.statusCode}');
    }

    final bytes = base64.decode(response.body);

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(bytes);

    return file.path;
  } catch (e) {
    return Future.error('Error: $e');
  }
}

Future<String> openFile(String filePath) async {
  try {
    final result = await OpenFile.open(filePath);
    if (result.type != ResultType.done) {
      return Future.error('Failed to open file: ${result.message}');
    }
    return 'File opened successfully';
  } catch (e) {
    return Future.error('Error opening file: $e');
  }
}
