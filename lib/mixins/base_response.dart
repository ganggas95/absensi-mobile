import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class BaseResponse<T> {
  @JsonKey(name: "data")
  final T? data;
  @JsonKey(name: "msg", includeIfNull: true)
  final String? msg;
  @JsonKey(name: "meta", includeIfNull: true)
  final Map<String, dynamic>? meta;
  @JsonKey(name: "errors", includeIfNull: true)
  final Map<String, List<String>>? errors;
  @JsonKey(name: "summary", includeIfNull: true)
  final Map<String, dynamic>? summary;

  BaseResponse({this.data, this.msg, this.meta, this.errors, this.summary});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(T Function(Object? json) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);

  BaseResponse<T> copyWith({
    T? data,
    String? msg,
    Map<String, dynamic>? meta,
    Map<String, List<String>>? errors,
    Map<String, dynamic>? summary,
  }) {
    return BaseResponse(
        data: data ?? this.data,
        msg: msg ?? this.msg,
        meta: meta ?? this.meta,
        errors: errors ?? this.errors,
        summary: summary ?? this.summary);
  }
}
