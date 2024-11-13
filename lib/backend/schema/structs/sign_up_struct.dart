// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SignUpStruct extends FFFirebaseStruct {
  SignUpStruct({
    String? username,
    String? email,
    String? password,
    String? passwordConfirm,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _username = username,
        _email = email,
        _password = password,
        _passwordConfirm = passwordConfirm,
        super(firestoreUtilData);

  // "username" field.
  String? _username;
  String get username => _username ?? '\$usernameInputValue';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '\$emailInputValue';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '\$passwordInputValue';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "passwordConfirm" field.
  String? _passwordConfirm;
  String get passwordConfirm => _passwordConfirm ?? '\$passwordConfirmValue';
  set passwordConfirm(String? val) => _passwordConfirm = val;

  bool hasPasswordConfirm() => _passwordConfirm != null;

  static SignUpStruct fromMap(Map<String, dynamic> data) => SignUpStruct(
        username: data['username'] as String?,
        email: data['email'] as String?,
        password: data['password'] as String?,
        passwordConfirm: data['passwordConfirm'] as String?,
      );

  static SignUpStruct? maybeFromMap(dynamic data) =>
      data is Map ? SignUpStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'username': _username,
        'email': _email,
        'password': _password,
        'passwordConfirm': _passwordConfirm,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'passwordConfirm': serializeParam(
          _passwordConfirm,
          ParamType.String,
        ),
      }.withoutNulls;

  static SignUpStruct fromSerializableMap(Map<String, dynamic> data) =>
      SignUpStruct(
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        passwordConfirm: deserializeParam(
          data['passwordConfirm'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SignUpStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SignUpStruct &&
        username == other.username &&
        email == other.email &&
        password == other.password &&
        passwordConfirm == other.passwordConfirm;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([username, email, password, passwordConfirm]);
}

SignUpStruct createSignUpStruct({
  String? username,
  String? email,
  String? password,
  String? passwordConfirm,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SignUpStruct(
      username: username,
      email: email,
      password: password,
      passwordConfirm: passwordConfirm,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SignUpStruct? updateSignUpStruct(
  SignUpStruct? signUp, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    signUp
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSignUpStructData(
  Map<String, dynamic> firestoreData,
  SignUpStruct? signUp,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (signUp == null) {
    return;
  }
  if (signUp.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && signUp.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final signUpData = getSignUpFirestoreData(signUp, forFieldValue);
  final nestedData = signUpData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = signUp.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSignUpFirestoreData(
  SignUpStruct? signUp, [
  bool forFieldValue = false,
]) {
  if (signUp == null) {
    return {};
  }
  final firestoreData = mapToFirestore(signUp.toMap());

  // Add any Firestore field values
  signUp.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSignUpListFirestoreData(
  List<SignUpStruct>? signUps,
) =>
    signUps?.map((e) => getSignUpFirestoreData(e, true)).toList() ?? [];
