import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UploadImageRecord extends FirestoreRecord {
  UploadImageRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "encImage" field.
  String? _encImage;
  String get encImage => _encImage ?? '';
  bool hasEncImage() => _encImage != null;

  // "firebaseURL" field.
  String? _firebaseURL;
  String get firebaseURL => _firebaseURL ?? '';
  bool hasFirebaseURL() => _firebaseURL != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _encImage = snapshotData['encImage'] as String?;
    _firebaseURL = snapshotData['firebaseURL'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('uploadImage')
          : FirebaseFirestore.instance.collectionGroup('uploadImage');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('uploadImage').doc(id);

  static Stream<UploadImageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UploadImageRecord.fromSnapshot(s));

  static Future<UploadImageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UploadImageRecord.fromSnapshot(s));

  static UploadImageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UploadImageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UploadImageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UploadImageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UploadImageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UploadImageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUploadImageRecordData({
  String? encImage,
  String? firebaseURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'encImage': encImage,
      'firebaseURL': firebaseURL,
    }.withoutNulls,
  );

  return firestoreData;
}

class UploadImageRecordDocumentEquality implements Equality<UploadImageRecord> {
  const UploadImageRecordDocumentEquality();

  @override
  bool equals(UploadImageRecord? e1, UploadImageRecord? e2) {
    return e1?.encImage == e2?.encImage && e1?.firebaseURL == e2?.firebaseURL;
  }

  @override
  int hash(UploadImageRecord? e) =>
      const ListEquality().hash([e?.encImage, e?.firebaseURL]);

  @override
  bool isValidKey(Object? o) => o is UploadImageRecord;
}
