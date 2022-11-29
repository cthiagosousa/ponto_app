import 'dart:async';
import 'package:ponto_app/modules/models/http_response.dart';

abstract class HttpService {
  Future<HttpResponse<T>> get<T>(
    String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers});
  Future<HttpResponse<T>> post<T>(
    String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers});
  Future<HttpResponse<T>> put<T>(
    String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers});
  Future<HttpResponse<T>> delete<T>(
    String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers});
}