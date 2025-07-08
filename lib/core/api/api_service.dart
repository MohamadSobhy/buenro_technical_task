import 'dart:io';

abstract class ApiService {
  /// Sets the current API KEY
  set token(String token);

  Future<dynamic> get({
    String? url,
    Map<String, Object>? query,
    Map<String, String>? headers,
  });

  Future<dynamic> post({
    String? url,
    Map<String, Object?>? body,
    Map<String, Object>? query,
    Map<String, String>? headers,
  });

  Future<dynamic> put({
    String? url,
    Map<String, Object?>? body,
    Map<String, Object>? query,
    Map<String, String>? headers,
  });

  Future<dynamic> patch({
    String? url,
    Map<String, Object?>? body,
    Map<String, Object>? query,
    Map<String, String>? headers,
  });

  Future<dynamic> delete({
    String? url,
    Map<String, Object>? query,
    Map<String, String>? headers,
  });

  Future<dynamic> multiPartRequest({
    String? url,
    Map<String, Object?>? body,
    Map<String, Object>? query,
    Map<String, String>? headers,
    List<MapEntry<String, File>> filesToUpload = const [],
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  });
}
