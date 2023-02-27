import 'dart:ffi';
import 'dart:io';

class User {
  late int? id;
  late String cpf;
  late String phone;
  late num balance;
  late String email;
  late String name;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.balance,
    required this.cpf,
    required this.id,
  });

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //       json['name'] as String,
  //       json['email'] as String,
  //       json['phone'] as String,
  //       json['balance'] as Float,
  //       json['cpf'] as String,
  //       json['id'] as int);
  // }
}
