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
import 'package:xml2json/xml2json.dart';

Future<dynamic> convertXMLToJSON(String xMLInput) async {
  // Add your function code here!
  final xml2json = Xml2Json();
  xml2json.parse(xMLInput);
  final jsonString = xml2json.toOpenRally();
  final jsonStringObject = jsonDecode(jsonString);
  print(jsonStringObject);
  return jsonStringObject;
}
