// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class JsonUrlStruct extends FFFirebaseStruct {
  JsonUrlStruct({
    String? status,
    String? downloadUrl,
    String? filename,
    String? expirationTime,
    String? message,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _downloadUrl = downloadUrl,
        _filename = filename,
        _expirationTime = expirationTime,
        _message = message,
        super(firestoreUtilData);

  // "status" field.
  String? _status;
  String get status => _status ?? 'defaultStatus';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "download_url" field.
  String? _downloadUrl;
  String get downloadUrl => _downloadUrl ?? 'defaultURL';
  set downloadUrl(String? val) => _downloadUrl = val;

  bool hasDownloadUrl() => _downloadUrl != null;

  // "filename" field.
  String? _filename;
  String get filename => _filename ?? 'defaultFile';
  set filename(String? val) => _filename = val;

  bool hasFilename() => _filename != null;

  // "expiration_time" field.
  String? _expirationTime;
  String get expirationTime => _expirationTime ?? 'time';
  set expirationTime(String? val) => _expirationTime = val;

  bool hasExpirationTime() => _expirationTime != null;

  // "message" field.
  String? _message;
  String get message => _message ?? 'defaultMessage';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  static JsonUrlStruct fromMap(Map<String, dynamic> data) => JsonUrlStruct(
        status: data['status'] as String?,
        downloadUrl: data['download_url'] as String?,
        filename: data['filename'] as String?,
        expirationTime: data['expiration_time'] as String?,
        message: data['message'] as String?,
      );

  static JsonUrlStruct? maybeFromMap(dynamic data) =>
      data is Map ? JsonUrlStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'download_url': _downloadUrl,
        'filename': _filename,
        'expiration_time': _expirationTime,
        'message': _message,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'download_url': serializeParam(
          _downloadUrl,
          ParamType.String,
        ),
        'filename': serializeParam(
          _filename,
          ParamType.String,
        ),
        'expiration_time': serializeParam(
          _expirationTime,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
      }.withoutNulls;

  static JsonUrlStruct fromSerializableMap(Map<String, dynamic> data) =>
      JsonUrlStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        downloadUrl: deserializeParam(
          data['download_url'],
          ParamType.String,
          false,
        ),
        filename: deserializeParam(
          data['filename'],
          ParamType.String,
          false,
        ),
        expirationTime: deserializeParam(
          data['expiration_time'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'JsonUrlStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is JsonUrlStruct &&
        status == other.status &&
        downloadUrl == other.downloadUrl &&
        filename == other.filename &&
        expirationTime == other.expirationTime &&
        message == other.message;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([status, downloadUrl, filename, expirationTime, message]);
}

JsonUrlStruct createJsonUrlStruct({
  String? status,
  String? downloadUrl,
  String? filename,
  String? expirationTime,
  String? message,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    JsonUrlStruct(
      status: status,
      downloadUrl: downloadUrl,
      filename: filename,
      expirationTime: expirationTime,
      message: message,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

JsonUrlStruct? updateJsonUrlStruct(
  JsonUrlStruct? jsonUrl, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    jsonUrl
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addJsonUrlStructData(
  Map<String, dynamic> firestoreData,
  JsonUrlStruct? jsonUrl,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (jsonUrl == null) {
    return;
  }
  if (jsonUrl.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && jsonUrl.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final jsonUrlData = getJsonUrlFirestoreData(jsonUrl, forFieldValue);
  final nestedData = jsonUrlData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = jsonUrl.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getJsonUrlFirestoreData(
  JsonUrlStruct? jsonUrl, [
  bool forFieldValue = false,
]) {
  if (jsonUrl == null) {
    return {};
  }
  final firestoreData = mapToFirestore(jsonUrl.toMap());

  // Add any Firestore field values
  jsonUrl.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getJsonUrlListFirestoreData(
  List<JsonUrlStruct>? jsonUrls,
) =>
    jsonUrls?.map((e) => getJsonUrlFirestoreData(e, true)).toList() ?? [];
