import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:weather_app/features/remote_config/data/models/remote_config_dto.dart';

part 'remote_config_remote_source.g.dart';

/// Remote config HTTP client seam.
///
/// Real endpoint swaps in here; today the repository reads from the local source.
@RestApi()
abstract class RemoteConfigApiClient {
  factory RemoteConfigApiClient(Dio dio, {String baseUrl}) =
      _RemoteConfigApiClient;

  @GET('/config')
  Future<RemoteConfigDto> getConfig();
}
