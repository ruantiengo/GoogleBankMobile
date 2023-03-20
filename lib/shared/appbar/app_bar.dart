import 'package:flutter/material.dart';
import 'package:google_bank_mobile/pages/login/google_service.dart';
import 'package:google_bank_mobile/shared/styles.dart';

class GoogleAppBar extends StatelessWidget {
  final bool containBackButton;
  final String? customText;
  const GoogleAppBar(
      {super.key, required this.containBackButton, this.customText});

  @override
  PreferredSizeWidget build(BuildContext context) {
    final authController = GoogleAuthService.myController;
    final name = authController.userName?.split(" ")[0];
    String text = customText ?? "";
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: const Color(blue),
      title: Text(text.isEmpty ? "Ola, $name" : customText!),
      automaticallyImplyLeading: containBackButton,
      titleSpacing: containBackButton ? 30 : 30,
      actions: [
        IconButton(
          visualDensity: const VisualDensity(horizontal: 4.0, vertical: 0),
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.people),
          iconSize: 32,
          alignment: Alignment.center,
          tooltip: 'About me',
          onPressed: () {
            // handle the press
          },
        ),
      ],
    );
  }
}
