import 'package:flutter/material.dart';
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
      decoration: BoxDecoration(
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
                    MaterialPageRoute(builder: (context) => PixAreaWidget()),
                  );
                }),
            MenuIcon(name: "Boleto", icon: Icons.qr_code, onPressed: () {}),
            MenuIcon(name: "Transferir", icon: Icons.payment, onPressed: () {}),
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
