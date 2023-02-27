// ignore_for_file: use_build_context_synchronously

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
  late num balance;

  @observable
  String? userName;

  @observable
  bool? isNewUser;

  @observable
  bool isLoading = false;

  @observable
  late GoogleSignIn googleSignIn;

  @observable
  String? accessToken;

  @action
  Future<void> signIn(BuildContext context) async {
    try {
      if (Platform.isIOS) {
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
          Uri.parse(
              "https://google-bank-api-production.up.railway.app/auth/google/authenticate"),
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
