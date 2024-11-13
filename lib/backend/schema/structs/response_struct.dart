// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ResponseStruct extends FFFirebaseStruct {
  ResponseStruct({
    String? downloadUrl,
    String? filename,
    String? message,
    String? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _downloadUrl = downloadUrl,
        _filename = filename,
        _message = message,
        _status = status,
        super(firestoreUtilData);

  // "download_url" field.
  String? _downloadUrl;
  String get downloadUrl => _downloadUrl ?? 'defaultURL';
  set downloadUrl(String? val) => _downloadUrl = val;

  bool hasDownloadUrl() => _downloadUrl != null;

  // "filename" field.
  String? _filename;
  String get filename => _filename ?? 'defaultFilename';
  set filename(String? val) => _filename = val;

  bool hasFilename() => _filename != null;

  // "message" field.
  String? _message;
  String get message => _message ?? 'defaultMessage';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "status" field.
  String? _status;
  String get status => _status ?? 'defaultStatus';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static ResponseStruct fromMap(Map<String, dynamic> data) => ResponseStruct(
        downloadUrl: data['download_url'] as String?,
        filename: data['filename'] as String?,
        message: data['message'] as String?,
        status: data['status'] as String?,
      );

  static ResponseStruct? maybeFromMap(dynamic data) =>
      data is Map ? ResponseStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'download_url': _downloadUrl,
        'filename': _filename,
        'message': _message,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'download_url': serializeParam(
          _downloadUrl,
          ParamType.String,
        ),
        'filename': serializeParam(
          _filename,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static ResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResponseStruct(
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
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResponseStruct &&
        downloadUrl == other.downloadUrl &&
        filename == other.filename &&
        message == other.message &&
        status == other.status;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([downloadUrl, filename, message, status]);
}

ResponseStruct createResponseStruct({
  String? downloadUrl,
  String? filename,
  String? message,
  String? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResponseStruct(
      downloadUrl: downloadUrl,
      filename: filename,
      message: message,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResponseStruct? updateResponseStruct(
  ResponseStruct? response, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    response
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResponseStructData(
  Map<String, dynamic> firestoreData,
  ResponseStruct? response,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (response == null) {
    return;
  }
  if (response.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && response.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final responseData = getResponseFirestoreData(response, forFieldValue);
  final nestedData = responseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = response.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResponseFirestoreData(
  ResponseStruct? response, [
  bool forFieldValue = false,
]) {
  if (response == null) {
    return {};
  }
  final firestoreData = mapToFirestore(response.toMap());

  // Add any Firestore field values
  response.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResponseListFirestoreData(
  List<ResponseStruct>? responses,
) =>
    responses?.map((e) => getResponseFirestoreData(e, true)).toList() ?? [];
