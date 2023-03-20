
import 'dart:io';

class AuthenticateRequest {
  int? id;
  String? cpf;
  String? phone;
  num? balance;
  bool isNewUser;
  File? report;
  String? email;
  String? name;
  String? accessToken;

  AuthenticateRequest(
    this.name,
    this.email,
    this.accessToken,
    this.isNewUser,
    this.phone,
    this.balance,
    this.cpf,
    this.id,
  );

  factory AuthenticateRequest.fromJson(Map<String, dynamic> json) {
    return AuthenticateRequest(
        json['name'] as String,
        json['email'] as String,
        json['accessToken'] as String,
        json['isNewUser'] as bool,
        json['phone'] as String,
        json['balance'] as num,
        json['cpf'] as String,
        json['id'] as int);
  }
}
