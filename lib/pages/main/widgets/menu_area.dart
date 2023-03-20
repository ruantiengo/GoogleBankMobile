import 'package:flutter/material.dart';
import 'package:google_bank_mobile/pages/history/history_page.dart';
import 'package:google_bank_mobile/pages/main/widgets/menu_icon.dart';
import 'package:google_bank_mobile/pages/pix/pix_area.dart';

class MenuArea extends StatefulWidget {
  const MenuArea({super.key});

  @override
  State<MenuArea> createState() => _MenuAreaState();
}

class _MenuAreaState extends State<MenuArea> {
  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(bottom: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MenuIcon(
                name: "Área pix",
                icon: Icons.pix,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PixAreaWidget()),
                  );
                }),
            MenuIcon(name: "Boleto", icon: Icons.qr_code, onPressed: () {}),
            MenuIcon(
                name: "Historico",
                icon: Icons.history,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryPage()));
                }),
            MenuIcon(
                name: "Emprestimo",
                icon: Icons.monetization_on,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
