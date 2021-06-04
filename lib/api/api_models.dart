import 'package:json_annotation/json_annotation.dart';

part 'api_models.g.dart';

// one time build：flutter pub run build_runner build
// watch for changes and build real-time：flutter pub run build_runner watch
// snippets: api-req・api-res・api-item

@JsonSerializable(explicitToJson: true)
class TagsGetRequest {
  TagsGetRequest();
  factory TagsGetRequest.fromJson(Map<String, dynamic> json) =>
      _$TagsGetRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TagsGetRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TagsGetResponse {
  List<String> tags;

  TagsGetResponse({required this.tags});
  factory TagsGetResponse.fromJson(Map<String, dynamic> json) =>
      _$TagsGetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TagsGetResponseToJson(this);
}
