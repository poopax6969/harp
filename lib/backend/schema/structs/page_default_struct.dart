// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PageDefaultStruct extends FFFirebaseStruct {
  PageDefaultStruct({
    bool? isTrue,
    bool? userLoggedIn,
    bool? requiresAuthentication,
    String? defaultUsername,
    String? defaultPassword,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isTrue = isTrue,
        _userLoggedIn = userLoggedIn,
        _requiresAuthentication = requiresAuthentication,
        _defaultUsername = defaultUsername,
        _defaultPassword = defaultPassword,
        super(firestoreUtilData);

  // "isTrue" field.
  bool? _isTrue;
  bool get isTrue => _isTrue ?? true;
  set isTrue(bool? val) => _isTrue = val;

  bool hasIsTrue() => _isTrue != null;

  // "userLoggedIn" field.
  bool? _userLoggedIn;
  bool get userLoggedIn => _userLoggedIn ?? true;
  set userLoggedIn(bool? val) => _userLoggedIn = val;

  bool hasUserLoggedIn() => _userLoggedIn != null;

  // "requiresAuthentication" field.
  bool? _requiresAuthentication;
  bool get requiresAuthentication => _requiresAuthentication ?? true;
  set requiresAuthentication(bool? val) => _requiresAuthentication = val;

  bool hasRequiresAuthentication() => _requiresAuthentication != null;

  // "defaultUsername" field.
  String? _defaultUsername;
  String get defaultUsername => _defaultUsername ?? '';
  set defaultUsername(String? val) => _defaultUsername = val;

  bool hasDefaultUsername() => _defaultUsername != null;

  // "defaultPassword" field.
  String? _defaultPassword;
  String get defaultPassword => _defaultPassword ?? '';
  set defaultPassword(String? val) => _defaultPassword = val;

  bool hasDefaultPassword() => _defaultPassword != null;

  static PageDefaultStruct fromMap(Map<String, dynamic> data) =>
      PageDefaultStruct(
        isTrue: data['isTrue'] as bool?,
        userLoggedIn: data['userLoggedIn'] as bool?,
        requiresAuthentication: data['requiresAuthentication'] as bool?,
        defaultUsername: data['defaultUsername'] as String?,
        defaultPassword: data['defaultPassword'] as String?,
      );

  static PageDefaultStruct? maybeFromMap(dynamic data) => data is Map
      ? PageDefaultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'isTrue': _isTrue,
        'userLoggedIn': _userLoggedIn,
        'requiresAuthentication': _requiresAuthentication,
        'defaultUsername': _defaultUsername,
        'defaultPassword': _defaultPassword,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isTrue': serializeParam(
          _isTrue,
          ParamType.bool,
        ),
        'userLoggedIn': serializeParam(
          _userLoggedIn,
          ParamType.bool,
        ),
        'requiresAuthentication': serializeParam(
          _requiresAuthentication,
          ParamType.bool,
        ),
        'defaultUsername': serializeParam(
          _defaultUsername,
          ParamType.String,
        ),
        'defaultPassword': serializeParam(
          _defaultPassword,
          ParamType.String,
        ),
      }.withoutNulls;

  static PageDefaultStruct fromSerializableMap(Map<String, dynamic> data) =>
      PageDefaultStruct(
        isTrue: deserializeParam(
          data['isTrue'],
          ParamType.bool,
          false,
        ),
        userLoggedIn: deserializeParam(
          data['userLoggedIn'],
          ParamType.bool,
          false,
        ),
        requiresAuthentication: deserializeParam(
          data['requiresAuthentication'],
          ParamType.bool,
          false,
        ),
        defaultUsername: deserializeParam(
          data['defaultUsername'],
          ParamType.String,
          false,
        ),
        defaultPassword: deserializeParam(
          data['defaultPassword'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PageDefaultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PageDefaultStruct &&
        isTrue == other.isTrue &&
        userLoggedIn == other.userLoggedIn &&
        requiresAuthentication == other.requiresAuthentication &&
        defaultUsername == other.defaultUsername &&
        defaultPassword == other.defaultPassword;
  }

  @override
  int get hashCode => const ListEquality().hash([
        isTrue,
        userLoggedIn,
        requiresAuthentication,
        defaultUsername,
        defaultPassword
      ]);
}

PageDefaultStruct createPageDefaultStruct({
  bool? isTrue,
  bool? userLoggedIn,
  bool? requiresAuthentication,
  String? defaultUsername,
  String? defaultPassword,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PageDefaultStruct(
      isTrue: isTrue,
      userLoggedIn: userLoggedIn,
      requiresAuthentication: requiresAuthentication,
      defaultUsername: defaultUsername,
      defaultPassword: defaultPassword,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PageDefaultStruct? updatePageDefaultStruct(
  PageDefaultStruct? pageDefault, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pageDefault
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPageDefaultStructData(
  Map<String, dynamic> firestoreData,
  PageDefaultStruct? pageDefault,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pageDefault == null) {
    return;
  }
  if (pageDefault.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pageDefault.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pageDefaultData =
      getPageDefaultFirestoreData(pageDefault, forFieldValue);
  final nestedData =
      pageDefaultData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pageDefault.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPageDefaultFirestoreData(
  PageDefaultStruct? pageDefault, [
  bool forFieldValue = false,
]) {
  if (pageDefault == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pageDefault.toMap());

  // Add any Firestore field values
  pageDefault.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPageDefaultListFirestoreData(
  List<PageDefaultStruct>? pageDefaults,
) =>
    pageDefaults?.map((e) => getPageDefaultFirestoreData(e, true)).toList() ??
    [];
