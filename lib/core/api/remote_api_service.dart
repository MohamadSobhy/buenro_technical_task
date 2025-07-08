import 'dart:io';

import 'package:buenro_technical_task/app_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

import '../../generated/l10n.dart';
import '../errors/exceptions.dart';
import 'api_service.dart';

class RemoteApiService implements ApiService {
  static const String _tag = '.APIService';
  static RemoteApiService _apiService = RemoteApiService._();
  static late Dio _client;
  static bool _initialized = false;

  static RemoteApiService get api => _apiService;

  /// Handle Locale
  String? _locale = AppModule.I.currentLangCode;

  get locale => _locale;

  set locale(locale) {
    _locale = locale;
  }

  @override
  set token(token) {
    logger.i('API Key: $token');
    _client.options.queryParameters['api_key'] = token;
  }

  RemoteApiService._();

  Logger get logger => AppModule.instance.logger;

  @visibleForTesting
  set setMockInstance(RemoteApiService instance) => _apiService = instance;

  void init() {
    if (!_initialized) {
      _client = Dio();
      _client.options.baseUrl = dotenv.maybeGet('API_BASE_URL') ?? '';
      _client.options.connectTimeout = const Duration(milliseconds: 30000);

      logger.i("$_tag Connnecting to: ${_client.options.baseUrl}");

      _client.interceptors.clear();

      _initialized = true;
    }
  }

  @override
  Future<dynamic> get({
    String? url,
    Map<String, Object>? query,
    Map<String, String>? headers,
  }) async {
    if (!_initialized) {
      init();
    }

    try {
      final Map<String, Object> builtHeaders = _headerBuilder(headers);
      _client.options.headers.addAll(builtHeaders);

      final response = await _client.get(_queryBuilder(url, query));

      logger.i(
        '[$_tag] Response:  ${response.data} | Method: ${response.statusCode}',
      );

      return _returnResponse(response);
    } on DioException catch (e) {
      logger.e("ERROR: ${e.response?.data}");
      return _returnResponse(e.response);
    }
  }

  @override
  Future<dynamic> post({
    String? url,
    Map<String, Object?>? body,
    Map<String, Object>? query,
    Map<String, String>? headers,

    bool showLogs = true,
  }) async {
    if (!_initialized) {
      init();
    }

    try {
      var builtHeaders = _headerBuilder(headers);
      _client.options.headers.addAll(builtHeaders);

      final response = await _client.post(
        _queryBuilder(url, query),
        data: body,
      );

      logger.i(
        '[$_tag] Response:  ${response.data} | Method: ${response.statusCode}',
      );

      return _returnResponse(response);
    } on DioException catch (e) {
      logger.e("ERROR: ${e.response?.data}");
      return _returnResponse(e.response);
    }
  }

  @override
  Future<dynamic> put({
    String? url,
    Map<String, Object?>? body,
    Map<String, Object>? query,
    Map<String, String>? headers,
  }) async {
    if (!_initialized) {
      init();
    }

    try {
      var builtHeaders = _headerBuilder(headers);
      _client.options.headers.addAll(builtHeaders);

      final response = await _client.put(_queryBuilder(url, query), data: body);

      logger.i(
        '[$_tag] Response:  ${response.data} | Method: ${response.statusCode}',
      );

      return _returnResponse(response);
    } on DioException catch (e) {
      logger.e(
        "ERROR: ${e.response?.data}, Status code: ${e.response?.statusCode}",
      );
      return _returnResponse(e.response);
    }
  }

  @override
  Future<dynamic> patch({
    String? url,
    Map<String, Object?>? body,
    Map<String, Object>? query,
    Map<String, Object>? headers,
  }) async {
    if (!_initialized) {
      init();
    }

    try {
      var builtHeaders = _headerBuilder(headers);
      _client.options.headers.addAll(builtHeaders);

      final response = await _client.patch(
        _queryBuilder(url, query),
        data: body,
      );

      logger.i(
        '[$_tag] Response:  ${response.data} | Method: ${response.statusCode}',
      );

      return _returnResponse(response);
    } on DioException catch (e) {
      logger.e("DioException ERROR: ${e.message}");
      logger.e("DioException ERROR: ${e.response!.statusCode}");
      logger.e("DioException ERROR: ${e.response!.data}");
      return _returnResponse(e.response);
    }
  }

  @override
  Future<dynamic> delete({
    String? url,
    Map<String, Object>? query,
    Map<String, String>? headers,
    Map<String, Object?>? body,
  }) async {
    if (!_initialized) {
      init();
    }

    try {
      var builtHeaders = _headerBuilder(headers);
      _client.options.headers.addAll(builtHeaders);

      final response = await _client.delete(
        _queryBuilder(url, query),
        data: body != null ? FormData.fromMap(body) : null,
      );

      logger.i(
        '[$_tag] Response:  ${response.data} | Method: ${response.statusCode}',
      );

      return _returnResponse(response);
    } on DioException catch (e) {
      logger.e("DioException ERROR: ${e.message}");
      logger.e("DioException ERROR: ${e.response!.statusCode}");
      logger.e("DioException ERROR: ${e.response!.data}");
      return _returnResponse(e.response);
    }
  }

  @override
  Future<dynamic> multiPartRequest({
    String? url,
    Map<String, Object?>? body,
    Map<String, Object>? query,
    Map<String, String>? headers,
    List<MapEntry<String, File>> filesToUpload = const [],
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    if (!_initialized) {
      init();
    }

    try {
      var builtHeaders = _headerBuilder(headers);
      _client.options.headers.addAll(builtHeaders);

      final formBody = FormData();

      body?.forEach((key, value) {
        formBody.fields.add(MapEntry(key, value.toString()));
      });

      for (var entry in filesToUpload) {
        final multiPartFile = await MultipartFile.fromFile(
          entry.value.path,
          filename: basename(entry.value.path),
        );

        formBody.files.add(MapEntry(entry.key, multiPartFile));
      }

      final response = await _client.post(
        _queryBuilder(url, query),
        data: formBody,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      logger.i(
        '[$_tag] Response:  ${response.data} | Method: ${response.statusCode}',
      );

      return _returnResponse(response);
    } on DioException catch (e) {
      logger.e("ERROR: ${e.response?.data}");
      return _returnResponse(e.response);
    }
  }

  Map<String, Object> _headerBuilder(Map<String, Object>? extraHeaders) {
    final headers = <String, Object>{};

    headers[HttpHeaders.acceptHeader] = 'application/json';
    headers[HttpHeaders.contentTypeHeader] = 'application/json';

    if (extraHeaders != null && extraHeaders.isNotEmpty) {
      extraHeaders.forEach((key, value) {
        headers[key] = value;
      });
    }

    return headers;
  }

  String _queryBuilder(String? path, Map<String, Object>? query) {
    final buffer = StringBuffer();
    bool removeLastChar = false;

    buffer.write(path);

    if (query != null) {
      if (query.isNotEmpty) {
        buffer.write('?');
      }

      query.forEach((key, value) {
        buffer.write('$key=$value&');
        removeLastChar = true;
      });

      if (removeLastChar) {
        /// REMOVE LAST &
        String result = buffer.toString();
        //return result.substring(0, result.length - 1);
        return result;
      }
    }

    return buffer.toString();
  }

  Object _returnResponse(Response? response) {
    if (response == null) {
      throw ServerException(message: S.current.unable_to_get_response_msg);
    }

    final responseJson = response.data;

    if (response.statusCode! >= 200 && response.statusCode! <= 299) {
      return responseJson;
    }

    final errorFromResponse = responseJson is String
        ? responseJson
        : _extractErrorFromResponse(responseJson, response.statusCode);

    switch (response.statusCode) {
      case 400:
        throw ServerException(message: errorFromResponse);
      case 401:
      case 403:
        throw UserNotAuthorizedException(message: errorFromResponse);
      case 404:
        throw ServerException(
          message:
              '${response.realUri.path} not found. Make sure that you add the .env file to the project',
        );
      case 503:
        throw MaintenanceModeException(message: errorFromResponse);

      case 500:
      default:
        final error =
            responseJson['error'] ??
            responseJson['errors'] ??
            responseJson['message'];

        throw ServerException(
          message: error?.toString() ?? S.current.unable_to_get_response_msg,
        );
    }
  }

  String _extractErrorFromResponse(
    Map<String, dynamic> parsedJson,
    int? statusCode,
  ) {
    final error =
        parsedJson['error'] ?? parsedJson['errors'] ?? parsedJson['message'];

    if (error != null) return error.toString();

    return S.current.defaultErrorMsg(statusCode ?? -1);
  }
}
