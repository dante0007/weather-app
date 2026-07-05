class ServerException implements Exception {
  const ServerException([this.message]);

  final String? message;

  @override
  String toString() => 'ServerException: ${message ?? 'no message'}';
}

class NetworkException implements Exception {
  const NetworkException([this.message]);

  final String? message;

  @override
  String toString() => 'NetworkException: ${message ?? 'no message'}';
}

class CacheException implements Exception {
  const CacheException([this.message]);

  final String? message;

  @override
  String toString() => 'CacheException: ${message ?? 'no message'}';
}

class ConfigParseException implements Exception {
  const ConfigParseException([this.message]);

  final String? message;

  @override
  String toString() => 'ConfigParseException: ${message ?? 'no message'}';
}
