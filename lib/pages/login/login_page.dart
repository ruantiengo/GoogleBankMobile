import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_bank_mobile/pages/login/google_service.dart';
import 'package:google_bank_mobile/pages/login/widget/curver_painter.dart';
import 'package:google_bank_mobile/pages/login/widget/google_button.dart';
import 'package:google_bank_mobile/shared/styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authController = GoogleAuthService.myController;

  final firstWordStyle = const TextStyle(
      color: Color(blue),
      fontSize: 48,
      decoration: TextDecoration.none,
      fontFamily: 'RockSalt');

  final anothersWordsStyle = const TextStyle(
      color: Color(white),
      fontSize: 48,
      decoration: TextDecoration.none,
      fontFamily: 'RockSalt');

  final googleTextStyle = const TextStyle(
      color: Color(white),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
      fontSize: 12);

  final bankTextStyle = const TextStyle(
      color: Color(white),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
      fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        decoration: const BoxDecoration(color: Color(blue)),
        child: CustomPaint(
          painter: const CurverPainter(),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: Column(
                  children: [
                    Text(
                      "Join",
                      style: firstWordStyle,
                    ),
                    const Text(
                      "to",
                      style: TextStyle(
                          color: Color(white),
                          fontSize: 48,
                          decoration: TextDecoration.none,
                          fontFamily: 'RockSalt'),
                    ),
                    Text(
                      "us",
                      style: anothersWordsStyle,
                    ),
                  ],
                ),
              ),
              const GoogleButton(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Google ",
                      style: googleTextStyle,
                    ),
                    Text("Bank", style: bankTextStyle)
                  ],
                ),
              )
            ],
          )),
        ),
      );
    });
  }
}
