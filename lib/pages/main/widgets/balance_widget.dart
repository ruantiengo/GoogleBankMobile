import 'package:flutter/material.dart';
import 'package:google_bank_mobile/pages/login/google_service.dart';
import 'package:google_bank_mobile/shared/styles.dart';
import 'package:intl/intl.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({super.key});

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  final userController = GoogleAuthService.myController;

  @override
  Widget build(BuildContext context) {
    var balance = userController.balance;
    final brlInFormat = NumberFormat.currency(locale: 'pt_BR', symbol: "R\$");

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Saldo",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    brlInFormat.format(balance),
                    style: const TextStyle(
                        fontSize: 24,
                        color: Color(green),
                        fontWeight: FontWeight.w500),
                  ),
                )
              ]),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
            child: const Icon(
              Icons.keyboard_arrow_right,
              size: 20,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
