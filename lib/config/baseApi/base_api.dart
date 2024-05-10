class BaseApi {
  static String baseUrl = "https://659f86b15023b02bfe89c737.mockapi.io/api/v1/";
  static Map<String, String> getBaseHeaders(String token) => ({
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });

  @override
  String toString() => BaseApi.baseUrl;
}
