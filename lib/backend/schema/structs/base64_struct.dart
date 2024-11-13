// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class Base64Struct extends FFFirebaseStruct {
  Base64Struct({
    String? downloadUrl,
    String? png,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _downloadUrl = downloadUrl,
        _png = png,
        super(firestoreUtilData);

  // "download_url" field.
  String? _downloadUrl;
  String get downloadUrl => _downloadUrl ?? 'signed_url';
  set downloadUrl(String? val) => _downloadUrl = val;

  bool hasDownloadUrl() => _downloadUrl != null;

  // "png" field.
  String? _png;
  String get png => _png ?? '.png';
  set png(String? val) => _png = val;

  bool hasPng() => _png != null;

  static Base64Struct fromMap(Map<String, dynamic> data) => Base64Struct(
        downloadUrl: data['download_url'] as String?,
        png: data['png'] as String?,
      );

  static Base64Struct? maybeFromMap(dynamic data) =>
      data is Map ? Base64Struct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'download_url': _downloadUrl,
        'png': _png,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'download_url': serializeParam(
          _downloadUrl,
          ParamType.String,
        ),
        'png': serializeParam(
          _png,
          ParamType.String,
        ),
      }.withoutNulls;

  static Base64Struct fromSerializableMap(Map<String, dynamic> data) =>
      Base64Struct(
        downloadUrl: deserializeParam(
          data['download_url'],
          ParamType.String,
          false,
        ),
        png: deserializeParam(
          data['png'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'Base64Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is Base64Struct &&
        downloadUrl == other.downloadUrl &&
        png == other.png;
  }

  @override
  int get hashCode => const ListEquality().hash([downloadUrl, png]);
}

Base64Struct createBase64Struct({
  String? downloadUrl,
  String? png,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    Base64Struct(
      downloadUrl: downloadUrl,
      png: png,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

Base64Struct? updateBase64Struct(
  Base64Struct? base64, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    base64
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBase64StructData(
  Map<String, dynamic> firestoreData,
  Base64Struct? base64,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (base64 == null) {
    return;
  }
  if (base64.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && base64.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final base64Data = getBase64FirestoreData(base64, forFieldValue);
  final nestedData = base64Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = base64.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBase64FirestoreData(
  Base64Struct? base64, [
  bool forFieldValue = false,
]) {
  if (base64 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(base64.toMap());

  // Add any Firestore field values
  base64.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBase64ListFirestoreData(
  List<Base64Struct>? base64s,
) =>
    base64s?.map((e) => getBase64FirestoreData(e, true)).toList() ?? [];
