abstract class HttpService {
  Future get(String path);
  Future post(String path, {Map<String, dynamic>? data});
  Future put(String path);
  Future delete(String path);
}