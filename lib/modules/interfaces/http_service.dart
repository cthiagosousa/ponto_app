import 'dart:async';
import 'package:ponto_app/modules/models/http_response.dart';

abstract class HttpService {
  FutureOr<HttpResponse> get(Map<String, dynamic>? params);
  FutureOr<HttpResponse> fetch(Map<String, dynamic>? params);
  FutureOr<HttpResponse> post(Map<String, dynamic>? params);
  FutureOr<HttpResponse> update(Map<String, dynamic>? params);
  FutureOr<HttpResponse> delete(Map<String, dynamic>? params);
}