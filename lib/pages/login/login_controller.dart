// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

import './interface/interface.dart';

part 'login_controller.g.dart';

class LoginPageController = _LoginPageControllerBase with _$LoginPageController;

abstract class _LoginPageControllerBase with Store {
  @observable
  bool isAuthenticated = false;

  @observable
  String? userEmail;

  @observable
  late User user;

  @observable
  num balance = 0;

  @observable
  String? userName;

  @observable
  bool? isNewUser;

  @observable
  int? userId;

  @observable
  bool isLoading = false;

  @observable
  GoogleSignIn googleSignIn = GoogleSignIn();

  @observable
  String? accessToken;

  @action
  Future<void> signIn(BuildContext context) async {
    try {
      if (Platform.isIOS == true) {
        googleSignIn = GoogleSignIn(
            clientId:
                "543273875319-4havjdds8objgnv6e865h0vs6d7t7bgq.apps.googleusercontent.com");
      } else {
        googleSignIn = GoogleSignIn();
      }

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }

      var res = await http.post(
          Uri.parse("http://192.168.5.129:3000/auth/google/authenticate"),
          body: {'email': googleUser.email, 'name': googleUser.displayName});

      final jsonResponse = jsonDecode(res.body);
      final authRequest = AuthenticateRequest.fromJson(jsonResponse);

      accessToken = authRequest.accessToken;

      if (authRequest.isNewUser) {
        // redirect para completar login
      } else {
        userName = authRequest.name;
        userEmail = authRequest.email;
        balance = authRequest.balance!;
        userId = authRequest.id!;
        Navigator.popAndPushNamed(context, "/main");
      }
    } catch (error) {
      print(error);
    }
  }

  @action
  Future<void> signOut() async {
    await googleSignIn.signOut();
    isAuthenticated = false;
    userEmail = null;
  }

  @action
  void setAccessToken(String token) {
    accessToken = token;
  }

  @action
  void setIsLoading(bool value) {
    isLoading = value;
  }
}
