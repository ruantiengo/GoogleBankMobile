import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_bank_mobile/pages/login/google_service.dart';
import 'package:google_bank_mobile/shared/styles.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GoogleAuthService.myController;
    const spinkit = Padding(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 24.0,
      ),
    );

    return Observer(builder: (context) {
      return Column(
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              controller.setIsLoading(true);
              await controller.signIn(context);
              controller.setIsLoading(false);
            },
            style: ButtonStyle(
                alignment: Alignment.center,
                maximumSize: MaterialStateProperty.all(const Size(350, 54)),
                backgroundColor: MaterialStateProperty.all(const Color(white))),
            icon: Image.asset(
              "assets/images/google_icon.png",
              width: 24,
              height: 24,
            ),
            label: const Text(
              "Sign in with Google",
              style: TextStyle(
                  color: Color(grey),
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600),
            ),
          ),
          controller.isLoading
              ? spinkit
              : const SizedBox(
                  height: 40,
                )
        ],
      );
    });
  }
}
