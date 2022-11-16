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
  FutureOr<HttpResponse> fetch(Map<String, dynamic>? params) {
    throw UnimplementedError();
  }

  @override
  FutureOr<HttpResponse> get(Map<String, dynamic>? params) async {
    try {
      final path = params?["path"];
      final queryParameters = params?["queryParameters"];
      final response = await dio.get(path, queryParameters: queryParameters);
      return HttpResponse.success(response.statusCode!, response.data);
    } on DioError catch (error) {
      return HttpResponse.error(error.response!.statusCode!, error.message);
    } catch (error, exception) {
      return Future.error(error, exception);
    }
  }

  @override
  FutureOr<HttpResponse> post(Map<String, dynamic>? params) async {
    try {
      final path = params?["path"];
      final queryParameters = params?["queryParameters"];
      final data = params?["data"];
      final response = await dio.post(path, queryParameters: queryParameters, data: data);
      return HttpResponse.success(response.statusCode!, response.data);
    } on DioError catch (error) {
      return HttpResponse.error(error.response!.statusCode!, error.message);
    } catch (error, exception) {
      return Future.error(error, exception);
    }
  }

  @override
  FutureOr<HttpResponse> update(Map<String, dynamic>? params) {
    throw UnimplementedError();
  }

  @override
  FutureOr<HttpResponse> delete(Map<String, dynamic>? params) {
    throw UnimplementedError();
  }
}