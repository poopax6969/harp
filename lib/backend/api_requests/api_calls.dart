import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class EncryptHideCall {
  static Future<ApiCallResponse> call({
    String? data = '',
    String? passphrase = '',
    FFUploadedFile? image,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'encryptHide',
      apiUrl:
          'https://us-central1-subtext-69ftp.cloudfunctions.net/main/encrypt_and_hide',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data,',
      },
      params: {
        'data': data,
        'passphrase': passphrase,
        'image_url': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ExtractDecryptCall {
  static Future<ApiCallResponse> call({
    String? passphrase = '\$.passphrase',
    String? image = '\$.downloadURL',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'extractDecrypt',
      apiUrl:
          'https://us-central1-subtext-69ftp.cloudfunctions.net/main/extract_and_decrypt',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data,',
      },
      params: {
        'passphrase': passphrase,
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? decryptedMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.decrypted_data''',
      ));
}

class TestflutCall {
  static Future<ApiCallResponse> call({
    String? data = '',
    String? passphrase = '',
    FFUploadedFile? image,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'testflut',
      apiUrl:
          'https://us-central1-subtext-69ftp.cloudfunctions.net/main/encrypt_and_hide',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data,',
      },
      params: {
        'data': data,
        'passphrase': passphrase,
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EncryptHideBASECall {
  static Future<ApiCallResponse> call({
    String? data = 'dataDefaultValue',
    String? passphrase = 'passphraseDefaultValue',
    FFUploadedFile? image,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'encryptHideBASE',
      apiUrl:
          'https://us-central1-subtext-69ftp.cloudfunctions.net/main-BASE64/encrypt_and_hide',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'data': data,
        'passphrase': passphrase,
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EncHideFBCall {
  static Future<ApiCallResponse> call({
    String? data = '',
    String? passphrase = '',
    String? image = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'encHideFB',
      apiUrl:
          'https://us-central1-subtext-69ftp.cloudfunctions.net/main/encrypt_and_hide',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'data': data,
        'passphrase': passphrase,
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? downloadURL(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.download_url''',
      ));
  static String? filename(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.filename''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
