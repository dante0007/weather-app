import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.serverFailure(String message) = ServerFailure;

  const factory Failure.networkFailure() = NetworkFailure;

  const factory Failure.cacheFailure() = CacheFailure;

  const factory Failure.configParseFailure(String message) = ConfigParseFailure;

  const factory Failure.unknownFailure(String message) = UnknownFailure;
}
