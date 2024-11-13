// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DecryptedStruct extends FFFirebaseStruct {
  DecryptedStruct({
    String? decryptedData,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _decryptedData = decryptedData,
        super(firestoreUtilData);

  // "decrypted_data" field.
  String? _decryptedData;
  String get decryptedData => _decryptedData ?? '';
  set decryptedData(String? val) => _decryptedData = val;

  bool hasDecryptedData() => _decryptedData != null;

  static DecryptedStruct fromMap(Map<String, dynamic> data) => DecryptedStruct(
        decryptedData: data['decrypted_data'] as String?,
      );

  static DecryptedStruct? maybeFromMap(dynamic data) => data is Map
      ? DecryptedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'decrypted_data': _decryptedData,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'decrypted_data': serializeParam(
          _decryptedData,
          ParamType.String,
        ),
      }.withoutNulls;

  static DecryptedStruct fromSerializableMap(Map<String, dynamic> data) =>
      DecryptedStruct(
        decryptedData: deserializeParam(
          data['decrypted_data'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DecryptedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DecryptedStruct && decryptedData == other.decryptedData;
  }

  @override
  int get hashCode => const ListEquality().hash([decryptedData]);
}

DecryptedStruct createDecryptedStruct({
  String? decryptedData,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DecryptedStruct(
      decryptedData: decryptedData,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DecryptedStruct? updateDecryptedStruct(
  DecryptedStruct? decrypted, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    decrypted
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDecryptedStructData(
  Map<String, dynamic> firestoreData,
  DecryptedStruct? decrypted,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (decrypted == null) {
    return;
  }
  if (decrypted.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && decrypted.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final decryptedData = getDecryptedFirestoreData(decrypted, forFieldValue);
  final nestedData = decryptedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = decrypted.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDecryptedFirestoreData(
  DecryptedStruct? decrypted, [
  bool forFieldValue = false,
]) {
  if (decrypted == null) {
    return {};
  }
  final firestoreData = mapToFirestore(decrypted.toMap());

  // Add any Firestore field values
  decrypted.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDecryptedListFirestoreData(
  List<DecryptedStruct>? decrypteds,
) =>
    decrypteds?.map((e) => getDecryptedFirestoreData(e, true)).toList() ?? [];
