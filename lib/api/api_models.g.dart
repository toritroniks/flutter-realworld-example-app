// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesGetRequest _$ArticlesGetRequestFromJson(Map<String, dynamic> json) {
  return ArticlesGetRequest(
    limit: json['limit'] as String,
    offset: json['offset'] as String,
  );
}

Map<String, dynamic> _$ArticlesGetRequestToJson(ArticlesGetRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
    };

ArticlesGetResponse _$ArticlesGetResponseFromJson(Map<String, dynamic> json) {
  return ArticlesGetResponse(
    articles: (json['articles'] as List<dynamic>)
        .map((e) => ArticleItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ArticlesGetResponseToJson(
        ArticlesGetResponse instance) =>
    <String, dynamic>{
      'articles': instance.articles.map((e) => e.toJson()).toList(),
    };

ArticleItem _$ArticleItemFromJson(Map<String, dynamic> json) {
  return ArticleItem(
    author: AuthorItem.fromJson(json['author'] as Map<String, dynamic>),
    body: json['body'] as String,
    createdAt: json['createdAt'] as String,
    description: json['description'] as String,
    favorited: json['favorited'] as bool,
    favoritesCount: json['favoritesCount'] as int,
    slug: json['slug'] as String,
    tagList:
        (json['tagList'] as List<dynamic>).map((e) => e as String).toList(),
    title: json['title'] as String,
    updatedAt: json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$ArticleItemToJson(ArticleItem instance) =>
    <String, dynamic>{
      'author': instance.author.toJson(),
      'body': instance.body,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'favorited': instance.favorited,
      'favoritesCount': instance.favoritesCount,
      'slug': instance.slug,
      'tagList': instance.tagList,
      'title': instance.title,
      'updatedAt': instance.updatedAt,
    };

AuthorItem _$AuthorItemFromJson(Map<String, dynamic> json) {
  return AuthorItem(
    bio: json['bio'] as String?,
    following: json['following'] as bool,
    image: json['image'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$AuthorItemToJson(AuthorItem instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'following': instance.following,
      'image': instance.image,
      'username': instance.username,
    };

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
