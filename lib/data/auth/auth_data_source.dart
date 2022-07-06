import 'package:ecommerce_flutter/data/entity/auth_user_entity.dart';

abstract class AuthDataSource {
  Future<AuthUserEntity?> loginByEmail(String email, String password);
}
