import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_realworld/api/api_models.dart';
import 'package:flutter_realworld/config/app_config.dart';
import 'package:flutter_realworld/constants/constants.dart';
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
    final headers = await _getHeaders(context);
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
    final res = await http.get(uri).timeout(Constants.apiTimeout);
    final resBody = json.decode(res.body);
    print('GET FINISH: $resBody');
    if (res.statusCode != 200) {
      throw Exception('API ERROR');
    }
    return resBody;
  }

  static Future<Map<String, String>> _getHeaders(BuildContext context) async {
    // final token = await context.read(loginProvider).token;
    return {
      'Content-Type': 'application/json; charset=utf-8',
      // 'Authorization': 'Token $token'
    };
  }

  static Future<TagsGetResponse> tagsGet(
    BuildContext context,
    TagsGetRequest req,
  ) async {
    final res = await _get(context, '/tags', TagsGetRequest());
    return TagsGetResponse.fromJson(res);
  }
}
