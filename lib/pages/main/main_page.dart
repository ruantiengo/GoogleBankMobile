import 'package:flutter/material.dart';
import 'package:google_bank_mobile/pages/main/main_controller.dart';
import 'package:google_bank_mobile/pages/main/widgets/balance_widget.dart';
import 'package:google_bank_mobile/pages/main/widgets/credit_card_area.dart';
import 'package:google_bank_mobile/pages/main/widgets/emprestimo.dart';
import 'package:google_bank_mobile/pages/main/widgets/menu_area.dart';
import 'package:google_bank_mobile/shared/appbar/app_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = MainPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GoogleAppBar(containBackButton: false).build(context),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            BalanceWidget(),
            MenuArea(),
            CreditCardWidget(),
            EmprestimoWidget(),
            EmprestimoWidget(),
            EmprestimoWidget(),
            EmprestimoWidget(),
          ],
        ),
      ),
    );
  }
}
