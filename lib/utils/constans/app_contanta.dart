import 'package:dio/dio.dart';

const String baseUrl = 'http://0.0.0.0:8080/api/v1';

final optionsDefault = Options(
  sendTimeout: 3000,
  followRedirects: false,
  validateStatus: (status) => status! <= 500,
);
