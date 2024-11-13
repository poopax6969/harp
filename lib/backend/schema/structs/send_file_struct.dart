// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SendFileStruct extends FFFirebaseStruct {
  SendFileStruct({
    String? outputData,
    String? mimetype,
    bool? asAttachment,
    String? downloadName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _outputData = outputData,
        _mimetype = mimetype,
        _asAttachment = asAttachment,
        _downloadName = downloadName,
        super(firestoreUtilData);

  // "output_data" field.
  String? _outputData;
  String get outputData => _outputData ?? '';
  set outputData(String? val) => _outputData = val;

  bool hasOutputData() => _outputData != null;

  // "mimetype" field.
  String? _mimetype;
  String get mimetype => _mimetype ?? 'img/png';
  set mimetype(String? val) => _mimetype = val;

  bool hasMimetype() => _mimetype != null;

  // "as_attachment" field.
  bool? _asAttachment;
  bool get asAttachment => _asAttachment ?? true;
  set asAttachment(bool? val) => _asAttachment = val;

  bool hasAsAttachment() => _asAttachment != null;

  // "download_name" field.
  String? _downloadName;
  String get downloadName => _downloadName ?? 'encrypted_image.png';
  set downloadName(String? val) => _downloadName = val;

  bool hasDownloadName() => _downloadName != null;

  static SendFileStruct fromMap(Map<String, dynamic> data) => SendFileStruct(
        outputData: data['output_data'] as String?,
        mimetype: data['mimetype'] as String?,
        asAttachment: data['as_attachment'] as bool?,
        downloadName: data['download_name'] as String?,
      );

  static SendFileStruct? maybeFromMap(dynamic data) =>
      data is Map ? SendFileStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'output_data': _outputData,
        'mimetype': _mimetype,
        'as_attachment': _asAttachment,
        'download_name': _downloadName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'output_data': serializeParam(
          _outputData,
          ParamType.String,
        ),
        'mimetype': serializeParam(
          _mimetype,
          ParamType.String,
        ),
        'as_attachment': serializeParam(
          _asAttachment,
          ParamType.bool,
        ),
        'download_name': serializeParam(
          _downloadName,
          ParamType.String,
        ),
      }.withoutNulls;

  static SendFileStruct fromSerializableMap(Map<String, dynamic> data) =>
      SendFileStruct(
        outputData: deserializeParam(
          data['output_data'],
          ParamType.String,
          false,
        ),
        mimetype: deserializeParam(
          data['mimetype'],
          ParamType.String,
          false,
        ),
        asAttachment: deserializeParam(
          data['as_attachment'],
          ParamType.bool,
          false,
        ),
        downloadName: deserializeParam(
          data['download_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SendFileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SendFileStruct &&
        outputData == other.outputData &&
        mimetype == other.mimetype &&
        asAttachment == other.asAttachment &&
        downloadName == other.downloadName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([outputData, mimetype, asAttachment, downloadName]);
}

SendFileStruct createSendFileStruct({
  String? outputData,
  String? mimetype,
  bool? asAttachment,
  String? downloadName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SendFileStruct(
      outputData: outputData,
      mimetype: mimetype,
      asAttachment: asAttachment,
      downloadName: downloadName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SendFileStruct? updateSendFileStruct(
  SendFileStruct? sendFile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sendFile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSendFileStructData(
  Map<String, dynamic> firestoreData,
  SendFileStruct? sendFile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sendFile == null) {
    return;
  }
  if (sendFile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sendFile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sendFileData = getSendFileFirestoreData(sendFile, forFieldValue);
  final nestedData = sendFileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sendFile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSendFileFirestoreData(
  SendFileStruct? sendFile, [
  bool forFieldValue = false,
]) {
  if (sendFile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sendFile.toMap());

  // Add any Firestore field values
  sendFile.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSendFileListFirestoreData(
  List<SendFileStruct>? sendFiles,
) =>
    sendFiles?.map((e) => getSendFileFirestoreData(e, true)).toList() ?? [];
