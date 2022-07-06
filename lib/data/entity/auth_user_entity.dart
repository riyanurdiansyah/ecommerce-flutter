class AuthUserEntity {
  int? status;
  String? message;
  Data? data;

  AuthUserEntity({this.status, this.message, this.data});

  AuthUserEntity.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  int? expiresIn;
  String? refreshToken;
  String? tokenType;
  User? user;

  Data(
      {this.accessToken,
      this.expiresIn,
      this.refreshToken,
      this.tokenType,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['expires_in'] = expiresIn;
    data['refresh_token'] = refreshToken;
    data['token_type'] = tokenType;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  AppMetadata? appMetadata;
  UserMetadata? userMetadata;
  String? aud;
  String? email;
  String? phone;
  String? createdAt;
  String? confirmedAt;
  String? emailConfirmedAt;
  String? phoneConfirmedAt;
  String? lastSignInAt;
  String? role;
  String? updatedAt;

  User(
      {this.id,
      this.appMetadata,
      this.userMetadata,
      this.aud,
      this.email,
      this.phone,
      this.createdAt,
      this.confirmedAt,
      this.emailConfirmedAt,
      this.phoneConfirmedAt,
      this.lastSignInAt,
      this.role,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appMetadata = json['app_metadata'] != null
        ? AppMetadata.fromJson(json['app_metadata'])
        : null;
    userMetadata = json['user_metadata'] != null
        ? UserMetadata.fromJson(json['user_metadata'])
        : null;
    aud = json['aud'];
    email = json['email'];
    phone = json['phone'];
    createdAt = json['created_at'];
    confirmedAt = json['confirmed_at'];
    emailConfirmedAt = json['email_confirmed_at'] ?? '';
    phoneConfirmedAt = json['phone_confirmed_at'] ?? '';
    lastSignInAt = json['last_sign_in_at'];
    role = json['role'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (appMetadata != null) {
      data['app_metadata'] = appMetadata!.toJson();
    }
    if (userMetadata != null) {
      data['user_metadata'] = userMetadata!.toJson();
    }
    data['aud'] = aud;
    data['email'] = email;
    data['phone'] = phone;
    data['created_at'] = createdAt;
    data['confirmed_at'] = confirmedAt;
    data['email_confirmed_at'] = emailConfirmedAt;
    data['phone_confirmed_at'] = phoneConfirmedAt;
    data['last_sign_in_at'] = lastSignInAt;
    data['role'] = role;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class AppMetadata {
  String? provider;
  List<String>? providers;

  AppMetadata({this.provider, this.providers});

  AppMetadata.fromJson(Map<String, dynamic> json) {
    provider = json['provider'];
    providers = json['providers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['provider'] = provider;
    data['providers'] = providers;
    return data;
  }
}

class UserMetadata {
  UserMetadata.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
