abstract class BaseApiServices{

  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(dynamic data, String url);

  Future<dynamic> fetchApi(String url, String token);

  Future<dynamic> fetchDataWithId(String baseUrl, String token, int id);

  Future<dynamic> updateData(String baseUrl, String token, int id, Map<String, dynamic> updatedData);

}