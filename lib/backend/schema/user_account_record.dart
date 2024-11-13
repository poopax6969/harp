import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAccountRecord extends FirestoreRecord {
  UserAccountRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "phrase" field.
  String? _phrase;
  String get phrase => _phrase ?? '';
  bool hasPhrase() => _phrase != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _userName = snapshotData['userName'] as String?;
    _phrase = snapshotData['phrase'] as String?;
    _uid = snapshotData['uid'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userAccount');

  static Stream<UserAccountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserAccountRecord.fromSnapshot(s));

  static Future<UserAccountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserAccountRecord.fromSnapshot(s));

  static UserAccountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserAccountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserAccountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserAccountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserAccountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserAccountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserAccountRecordData({
  String? userName,
  String? phrase,
  String? uid,
  String? email,
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userName': userName,
      'phrase': phrase,
      'uid': uid,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserAccountRecordDocumentEquality implements Equality<UserAccountRecord> {
  const UserAccountRecordDocumentEquality();

  @override
  bool equals(UserAccountRecord? e1, UserAccountRecord? e2) {
    return e1?.userName == e2?.userName &&
        e1?.phrase == e2?.phrase &&
        e1?.uid == e2?.uid &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(UserAccountRecord? e) => const ListEquality().hash([
        e?.userName,
        e?.phrase,
        e?.uid,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is UserAccountRecord;
}
