import 'package:flutter/material.dart';
import 'package:google_bank_mobile/shared/styles.dart';

class MenuIcon extends StatefulWidget {
  final String name;
  final IconData icon;
  final Function() onPressed;
  const MenuIcon(
      {super.key,
      required this.name,
      required this.icon,
      required this.onPressed});

  @override
  State<MenuIcon> createState() => _MenuIconState();
}

class _MenuIconState extends State<MenuIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(blue),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(14)),
            onPressed: widget.onPressed,
            child: Icon(widget.icon)),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            widget.name,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
