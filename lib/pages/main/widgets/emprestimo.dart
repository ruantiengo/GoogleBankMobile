import 'package:flutter/material.dart';
import 'package:google_bank_mobile/pages/login/google_service.dart';
import 'package:google_bank_mobile/shared/styles.dart';
import 'package:intl/intl.dart';

class EmprestimoWidget extends StatefulWidget {
  const EmprestimoWidget({super.key});

  @override
  State<EmprestimoWidget> createState() => _EmprestimoWidgetState();
}

class _EmprestimoWidgetState extends State<EmprestimoWidget> {
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
              const Text("Emprestimo",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Valor disponivel"),
                    Padding(
                      padding: const EdgeInsets.only(top: 9.0),
                      child: Text(
                        brlInFormat.format(18000),
                        style: const TextStyle(
                            fontSize: 24,
                            color: Color(grey),
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
