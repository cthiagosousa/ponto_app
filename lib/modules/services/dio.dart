import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ponto_app/modules/app/constants.dart';
import 'package:ponto_app/modules/interfaces/http_service.dart';
import 'package:ponto_app/modules/models/http_response.dart';

class DioService implements HttpService {

  Dio get dio {
    final BaseOptions options = BaseOptions(
      baseUrl: baseApiUrl,
      headers: {"Content-Type": "application/json"},
    );
    
    final Dio _dio = Dio(options);
    return _dio;
  }
  
  @override
  Future<HttpResponse<T>> get<T>(path, {data, queryParameters, headers}) {
    // TODO: implement fetch
    throw UnimplementedError();
  }
  
  @override
  Future<HttpResponse<T>> post<T>(path, {data, queryParameters, headers}) {
    // TODO: implement post
    throw UnimplementedError();
  }
  
  @override
  Future<HttpResponse<T>> put<T>(path, {data, queryParameters, headers}) {
    // TODO: implement update
    throw UnimplementedError();
  }
  
  @override
  Future<HttpResponse<T>> delete<T>(path, {data, queryParameters, headers}) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}