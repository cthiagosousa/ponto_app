class HttpResponse<T> {
  final T? data;
  final int? statusCode;
  final String? statusMessage;
  final Map<String, dynamic>? headers;
  final String? uri;

  HttpResponse({
    this.data, 
    this.statusCode, 
    this.statusMessage, 
    this.headers, 
    this.uri,
  });
}
