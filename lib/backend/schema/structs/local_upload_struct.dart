// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocalUploadStruct extends FFFirebaseStruct {
  LocalUploadStruct({
    LocalUploadStruct? localUpload,
    String? uploadedFirebaseURL,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _localUpload = localUpload,
        _uploadedFirebaseURL = uploadedFirebaseURL,
        super(firestoreUtilData);

  // "localUpload" field.
  LocalUploadStruct? _localUpload;
  LocalUploadStruct get localUpload => _localUpload ?? LocalUploadStruct();
  set localUpload(LocalUploadStruct? val) => _localUpload = val;

  void updateLocalUpload(Function(LocalUploadStruct) updateFn) {
    updateFn(_localUpload ??= LocalUploadStruct());
  }

  bool hasLocalUpload() => _localUpload != null;

  // "uploadedFirebaseURL" field.
  String? _uploadedFirebaseURL;
  String get uploadedFirebaseURL => _uploadedFirebaseURL ?? 'url';
  set uploadedFirebaseURL(String? val) => _uploadedFirebaseURL = val;

  bool hasUploadedFirebaseURL() => _uploadedFirebaseURL != null;

  static LocalUploadStruct fromMap(Map<String, dynamic> data) =>
      LocalUploadStruct(
        localUpload: LocalUploadStruct.maybeFromMap(data['localUpload']),
        uploadedFirebaseURL: data['uploadedFirebaseURL'] as String?,
      );

  static LocalUploadStruct? maybeFromMap(dynamic data) => data is Map
      ? LocalUploadStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'localUpload': _localUpload?.toMap(),
        'uploadedFirebaseURL': _uploadedFirebaseURL,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'localUpload': serializeParam(
          _localUpload,
          ParamType.DataStruct,
        ),
        'uploadedFirebaseURL': serializeParam(
          _uploadedFirebaseURL,
          ParamType.String,
        ),
      }.withoutNulls;

  static LocalUploadStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocalUploadStruct(
        localUpload: deserializeStructParam(
          data['localUpload'],
          ParamType.DataStruct,
          false,
          structBuilder: LocalUploadStruct.fromSerializableMap,
        ),
        uploadedFirebaseURL: deserializeParam(
          data['uploadedFirebaseURL'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LocalUploadStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocalUploadStruct &&
        localUpload == other.localUpload &&
        uploadedFirebaseURL == other.uploadedFirebaseURL;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([localUpload, uploadedFirebaseURL]);
}

LocalUploadStruct createLocalUploadStruct({
  LocalUploadStruct? localUpload,
  String? uploadedFirebaseURL,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocalUploadStruct(
      localUpload:
          localUpload ?? (clearUnsetFields ? LocalUploadStruct() : null),
      uploadedFirebaseURL: uploadedFirebaseURL,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocalUploadStruct? updateLocalUploadStruct(
  LocalUploadStruct? localUploadStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    localUploadStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocalUploadStructData(
  Map<String, dynamic> firestoreData,
  LocalUploadStruct? localUploadStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (localUploadStruct == null) {
    return;
  }
  if (localUploadStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && localUploadStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final localUploadStructData =
      getLocalUploadFirestoreData(localUploadStruct, forFieldValue);
  final nestedData =
      localUploadStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = localUploadStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocalUploadFirestoreData(
  LocalUploadStruct? localUploadStruct, [
  bool forFieldValue = false,
]) {
  if (localUploadStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(localUploadStruct.toMap());

  // Handle nested data for "localUpload" field.
  addLocalUploadStructData(
    firestoreData,
    localUploadStruct.hasLocalUpload() ? localUploadStruct.localUpload : null,
    'localUpload',
    forFieldValue,
  );

  // Add any Firestore field values
  localUploadStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocalUploadListFirestoreData(
  List<LocalUploadStruct>? localUploadStructs,
) =>
    localUploadStructs
        ?.map((e) => getLocalUploadFirestoreData(e, true))
        .toList() ??
    [];
