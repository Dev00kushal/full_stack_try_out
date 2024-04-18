// yo cheii euta base class ho jasma getApiResponse ani postApiResponse function xa
abstract class BaseApiServices {
  Future<dynamic> getApiResponse(String url);
  Future<dynamic> postApiResponse(String url, dynamic data);
}
