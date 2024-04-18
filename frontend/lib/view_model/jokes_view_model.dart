import 'package:blog_application/data/network/NetworkApiService.dart';
import 'package:blog_application/data/network/baseApiServices.dart';
import 'package:blog_application/res/app_url.dart';
import 'package:flutter/material.dart';

import '../model/jokes_model.dart';

class JokesViewModel extends ChangeNotifier {
  // base api services vaneko yesto type ho (actually asbstract class cha tyo cheii) ani networkApiservices ma cheii GET,POST function cha yeslai use garna ko lagi instance banayeko ho
  final BaseApiServices _baseApiServices = NetworkApiServices();

//  Simple cha yesma jokes ko model le joke as a paramter banako why ? enum jastai hos vanera ani teslai post garira ko chu data endpoint ma data garera add  huncha  json ma aba teii ho

  Future<dynamic> addJokes(Joke joke) async {
    try {
      dynamic response = await _baseApiServices.postApiResponse(
          AppUrls.addJokesUrl, joke.toJson());
      return response;
    } catch (e) {
      debugPrint('Error: $e');
      rethrow;
    }
  }

  // yo function ma url cheii url(endpoint) bata ayeko data lai response ma halera return garxa just fetching data k nothing more !! 😀
  Future<dynamic> getJokes() async {
    try {
      dynamic response =
          await _baseApiServices.getApiResponse(AppUrls.getJokesUrl);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
