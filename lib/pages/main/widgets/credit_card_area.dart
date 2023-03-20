import 'package:flutter/material.dart';
import 'package:google_bank_mobile/pages/login/google_service.dart';
import 'package:google_bank_mobile/shared/styles.dart';
import 'package:intl/intl.dart';

class CreditCardWidget extends StatefulWidget {
  const CreditCardWidget({super.key});

  @override
  State<CreditCardWidget> createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends State<CreditCardWidget> {
  final userController = GoogleAuthService.myController;

  @override
  Widget build(BuildContext context) {
    final brlInFormat = NumberFormat.currency(locale: 'pt_BR', symbol: "R\$");

    return Container(
      width: double.infinity, // ocupa toda a largura da tela
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey, // cor da borda
            width: 1.0, // espessura da borda
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Cartão de crédito",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Fatura atual"),
                    Padding(
                      padding: const EdgeInsets.only(top: 9.0),
                      child: Text(
                        brlInFormat.format(0),
                        style: const TextStyle(
                            fontSize: 24,
                            color: Color(red),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
