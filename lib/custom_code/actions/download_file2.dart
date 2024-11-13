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

import 'dart:io';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

Future<FFUploadedFile?> downloadFile2(String url) async {
  try {
    if (url.isEmpty) return null;

    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      final fileBytes = res.bodyBytes;
      final fileName = const Uuid().v4().toString();
      final File file =
          File('${(await getApplicationDocumentsDirectory()).path}/$fileName');
      await file.writeAsBytes(fileBytes);

      final mimeType = lookupMimeType(file.path, headerBytes: fileBytes);
      final extension = mimeType != null ? extensionFromMime(mimeType) : '';

      File renamedFile = extension.isNotEmpty
          ? await file.rename('${file.path}.$extension')
          : file;

      debugPrint('File downloaded and saved at path: ${renamedFile.path}');
      return FFUploadedFile(
          bytes: await renamedFile.readAsBytes(), name: fileName);
    } else {
      debugPrint('Error during download. Status code: ${res.statusCode}');
    }
  } catch (e) {
    debugPrint('Error downloading file : $e');
  }
  return null;
}
