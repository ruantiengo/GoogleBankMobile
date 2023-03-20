import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_bank_mobile/pages/history/history_controller.dart';
import 'package:google_bank_mobile/pages/history/widget/list.dart';
import 'package:google_bank_mobile/pages/login/google_service.dart';

import 'package:google_bank_mobile/shared/appbar/app_bar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final userController = GoogleAuthService.myController;

  @override
  Widget build(BuildContext context) {
    HistoryController controller =
        HistoryController(context, userController.userId!);

    return Scaffold(
      appBar: const GoogleAppBar(
        containBackButton: true,
        customText: "Histórico",
      ).build(context),
      body: Observer(builder: (context) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          child: HistoryList(
            items: controller.transfers,
          ),
        );
      }),
    );
  }
}
