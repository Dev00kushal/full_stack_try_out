import 'package:blog_application/data/network/NetworkApiService.dart';
import 'package:blog_application/data/network/baseApiServices.dart';
import 'package:blog_application/res/app_url.dart';

class AuthRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _baseApiServices.postApiResponse(AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
