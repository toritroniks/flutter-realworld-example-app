import 'package:json_annotation/json_annotation.dart';

part 'api_models.g.dart';

// one time build：flutter pub run build_runner build
// watch for changes and build real-time：flutter pub run build_runner watch
// snippets: api-req・api-res・api-item

@JsonSerializable(explicitToJson: true)
class ArticlesGetRequest {
  String limit;
  String offset;

  ArticlesGetRequest({
    required this.limit,
    required this.offset,
  });
  factory ArticlesGetRequest.fromJson(Map<String, dynamic> json) =>
      _$ArticlesGetRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesGetRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ArticlesGetResponse {
  List<ArticleItem> articles;
  ArticlesGetResponse({required this.articles});
  factory ArticlesGetResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesGetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesGetResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ArticleItem {
  AuthorItem author;
  String body;
  String createdAt;
  String description;
  bool favorited;
  int favoritesCount;
  String slug;
  List<String> tagList;
  String title;
  String updatedAt;

  ArticleItem({
    required this.author,
    required this.body,
    required this.createdAt,
    required this.description,
    required this.favorited,
    required this.favoritesCount,
    required this.slug,
    required this.tagList,
    required this.title,
    required this.updatedAt,
  });
  factory ArticleItem.fromJson(Map<String, dynamic> json) =>
      _$ArticleItemFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AuthorItem {
  String? bio;
  bool following;
  String image;
  String username;

  AuthorItem({
    required this.bio,
    required this.following,
    required this.image,
    required this.username,
  });
  factory AuthorItem.fromJson(Map<String, dynamic> json) =>
      _$AuthorItemFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorItemToJson(this);
}

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
