import 'package:flutter/material.dart';
import 'package:google_bank_mobile/shared/styles.dart';

class PixAreaButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final IconData icon;
  const PixAreaButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: ElevatedButton.icon(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(blue),
          ),
          icon: Icon(icon),
          label: Text(title)),
    );
  }
}
