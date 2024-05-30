import 'dart:core';
import 'dart:io';
import 'package:example_30_may_24/core/exceptions/exceptions.dart';
import 'package:example_30_may_24/core/resources/app_urls.dart';
import 'package:example_30_may_24/data/base/base_api_services.dart';
import 'package:example_30_may_24/data/base/interceptor.dart';
import 'package:dio/dio.dart';

class NetworkApiServices extends BaseApiServices {
  late final _client;

  static final BaseOptions _options = BaseOptions(
    baseUrl: AppUrls.baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );

  NetworkApiServices() {
    _client = Dio(_options);
    _client.interceptors.add(DioInterceptors());
  }

  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response = await _client.get(url);
      return response;
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
  }

  @override
  Future postApi(data, String url) {
    // TODO: implement postApi
    throw UnimplementedError();
  }
}
