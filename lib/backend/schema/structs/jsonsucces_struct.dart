// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class JsonsuccesStruct extends FFFirebaseStruct {
  JsonsuccesStruct({
    String? status,
    String? message,
    String? downloadUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _message = message,
        _downloadUrl = downloadUrl,
        super(firestoreUtilData);

  // "status" field.
  String? _status;
  String get status => _status ?? 'success';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "message" field.
  String? _message;
  String get message => _message ?? 'File encrypted and ready for download';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "download_url" field.
  String? _downloadUrl;
  String get downloadUrl => _downloadUrl ?? '\$[\'signed_url\']';
  set downloadUrl(String? val) => _downloadUrl = val;

  bool hasDownloadUrl() => _downloadUrl != null;

  static JsonsuccesStruct fromMap(Map<String, dynamic> data) =>
      JsonsuccesStruct(
        status: data['status'] as String?,
        message: data['message'] as String?,
        downloadUrl: data['download_url'] as String?,
      );

  static JsonsuccesStruct? maybeFromMap(dynamic data) => data is Map
      ? JsonsuccesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'message': _message,
        'download_url': _downloadUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'download_url': serializeParam(
          _downloadUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static JsonsuccesStruct fromSerializableMap(Map<String, dynamic> data) =>
      JsonsuccesStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        downloadUrl: deserializeParam(
          data['download_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'JsonsuccesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is JsonsuccesStruct &&
        status == other.status &&
        message == other.message &&
        downloadUrl == other.downloadUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([status, message, downloadUrl]);
}

JsonsuccesStruct createJsonsuccesStruct({
  String? status,
  String? message,
  String? downloadUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    JsonsuccesStruct(
      status: status,
      message: message,
      downloadUrl: downloadUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

JsonsuccesStruct? updateJsonsuccesStruct(
  JsonsuccesStruct? jsonsucces, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    jsonsucces
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addJsonsuccesStructData(
  Map<String, dynamic> firestoreData,
  JsonsuccesStruct? jsonsucces,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (jsonsucces == null) {
    return;
  }
  if (jsonsucces.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && jsonsucces.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final jsonsuccesData = getJsonsuccesFirestoreData(jsonsucces, forFieldValue);
  final nestedData = jsonsuccesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = jsonsucces.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getJsonsuccesFirestoreData(
  JsonsuccesStruct? jsonsucces, [
  bool forFieldValue = false,
]) {
  if (jsonsucces == null) {
    return {};
  }
  final firestoreData = mapToFirestore(jsonsucces.toMap());

  // Add any Firestore field values
  jsonsucces.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getJsonsuccesListFirestoreData(
  List<JsonsuccesStruct>? jsonsuccess,
) =>
    jsonsuccess?.map((e) => getJsonsuccesFirestoreData(e, true)).toList() ?? [];
