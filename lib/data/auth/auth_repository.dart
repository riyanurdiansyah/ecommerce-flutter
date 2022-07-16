import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/data/auth/auth_data_source.dart';
import 'package:ecommerce_flutter/data/entity/auth_user_entity.dart';
import 'package:ecom_setup/ecom_setup.dart';

class AuthRepository extends AuthDataSource {
  late Dio _dio;

  AuthRepository({
    Dio? dio,
  }) {
    _dio = dio ?? Dio();
  }

  @override
  Future<AuthUserEntity?> loginByEmail(String email, String password) async {
    final body = jsonEncode({
      'email': email,
      'password': password,
    });
    final response = await _dio.post(
      '$baseUrl/auth/signin',
      data: body,
      options: Options(
        validateStatus: (status) => status! < 500,
      ),
    );
    return AuthUserEntity.fromJson(response.data);
  }
}
