// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagsGetRequest _$TagsGetRequestFromJson(Map<String, dynamic> json) {
  return TagsGetRequest();
}

Map<String, dynamic> _$TagsGetRequestToJson(TagsGetRequest instance) =>
    <String, dynamic>{};

TagsGetResponse _$TagsGetResponseFromJson(Map<String, dynamic> json) {
  return TagsGetResponse(
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$TagsGetResponseToJson(TagsGetResponse instance) =>
    <String, dynamic>{
      'tags': instance.tags,
    };
