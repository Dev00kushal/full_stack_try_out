import 'package:blog_application/data/network/NetworkApiService.dart';
import 'package:blog_application/data/network/baseApiServices.dart';
import 'package:blog_application/res/app_url.dart';
import 'package:flutter/material.dart';

import '../model/jokes_model.dart';

class JokesViewModel extends ChangeNotifier {
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<dynamic> addJokes(Joke joke) async {
    try {
      dynamic response = await _baseApiServices.postApiResponse(
          AppUrls.jokesUrl, joke.toJson());
      return response;
    } catch (e) {
      debugPrint('Error: $e');
      rethrow;
    }
  }
}
