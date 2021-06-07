import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_realworld/api/api_models.dart';
import 'package:flutter_realworld/api/mock.dart';
import 'package:flutter_realworld/config/app_config.dart';
import 'package:flutter_realworld/constants/constants.dart';
import 'package:flutter_realworld/providers/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<dynamic> _post(
    BuildContext context,
    String path,
    dynamic req,
  ) async {
    final reqBody = json.encode(req);
    print('POST：$path\n$reqBody');
    final uri = Uri.https(config.apiEndpoint, '/api$path');
    final headers = await _postHeaders(context);
    final res = await http
        .post(
          uri,
          headers: headers,
          body: reqBody,
        )
        .timeout(Constants.apiTimeout);
    final resBody = json.decode(res.body);
    print('POST FINISH: $resBody');
    if (res.statusCode != 200) {
      throw Exception('API ERROR');
    }
    return resBody;
  }

  static Future<dynamic> _get(
    BuildContext context,
    String path,
    dynamic req,
  ) async {
    final Map<String, dynamic> queryParams = req.toJson();
    print('GET：$path\n$queryParams');
    final uri = Uri.https(config.apiEndpoint, '/api$path', queryParams);
    final headers = await _getHeaders(context);
    final res = await http
        .get(
          uri,
          headers: headers,
        )
        .timeout(Constants.apiTimeout);
    final resBody = json.decode(res.body);
    print('GET FINISH: $resBody');
    if (res.statusCode != 200) {
      throw Exception('API ERROR');
    }
    return resBody;
  }

  static Future<Map<String, String>> _getHeaders(BuildContext context) async {
    final token = await context.read(loginProvider).token;
    return {if (token != null) 'Authorization': 'Token $token'};
  }

  static Future<Map<String, String>> _postHeaders(BuildContext context) async {
    final token = await context.read(loginProvider).token;
    return {
      'Content-Type': 'application/json; charset=utf-8',
      if (token != null) 'Authorization': 'Token $token'
    };
  }

  static Future<ArticlesGetResponse> articlesGet(
    BuildContext context,
    ArticlesGetRequest req,
  ) async {
    final res = await _get(context, '/articles', req);
    return ArticlesGetResponse.fromJson(res);
    // return ArticlesGetResponse.fromJson(json.decode(mockArticlesGet));
  }

  static Future<TagsGetResponse> tagsGet(
    BuildContext context,
    TagsGetRequest req,
  ) async {
    final res = await _get(context, '/tags', req);
    return TagsGetResponse.fromJson(res);
    // return TagsGetResponse.fromJson(json.decode(mockTagsGet));
  }

  static Future<LoginPostResponse> loginPost(
    BuildContext context,
    LoginPostRequest req,
  ) async {
    final res = await _post(context, '/users/login', req);
    return LoginPostResponse.fromJson(res);
  }

  static Future<UserGetResponse> userGet(
    BuildContext context,
    UserGetRequest req,
  ) async {
    final res = await _get(context, '/user', req);
    return UserGetResponse.fromJson(res);
  }
}
