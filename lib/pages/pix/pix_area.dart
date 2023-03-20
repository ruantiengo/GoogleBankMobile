import 'package:flutter/material.dart';
import 'package:google_bank_mobile/pages/pix/widget/pix_area_button.dart';
import 'package:google_bank_mobile/shared/appbar/app_bar.dart';

class PixAreaWidget extends StatefulWidget {
  const PixAreaWidget({super.key});

  @override
  State<PixAreaWidget> createState() => _PixAreaWidgetState();
}

class _PixAreaWidgetState extends State<PixAreaWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GoogleAppBar(
        containBackButton: true,
        customText: "Pix Area",
      ).build(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PixAreaButton(
              title: "Nova chave",
              onPressed: () {
                Navigator.pushNamed(context, "/new-key");
              },
              icon: Icons.plus_one_sharp,
            ),
            PixAreaButton(
              title: "Minhas Chaves",
              onPressed: () {
                Navigator.pushNamed(context, "/my-keys");
              },
              icon: Icons.key,
            ),
            PixAreaButton(
              title: "Transferir",
              onPressed: () {
                Navigator.pushNamed(context, "/transfer");
              },
              icon: Icons.send,
            ),
          ],
        ),
      ),
    );
  }
}
