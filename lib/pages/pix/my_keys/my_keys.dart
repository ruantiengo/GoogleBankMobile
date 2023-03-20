import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_bank_mobile/pages/login/google_service.dart';
import 'package:google_bank_mobile/pages/pix/my_keys/widgets/key_list.dart';
import 'package:google_bank_mobile/pages/pix/pix_controller.dart';
import 'package:google_bank_mobile/shared/appbar/app_bar.dart';

class MyKeysPage extends StatefulWidget {
  const MyKeysPage({super.key});

  @override
  State<MyKeysPage> createState() => _MyKeysPageState();
}

class _MyKeysPageState extends State<MyKeysPage> {
  final controller = PixPageController();
  final user = GoogleAuthService.myController;
  @override
  void initState() {
    super.initState();
    controller.getKeys(
        context, user.userId!); // Carrega os dados ao iniciar a página
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const GoogleAppBar(
          containBackButton: true,
          customText: "Minhas chaves",
        ).build(context),
        body: Observer(
          builder: (_) {
            if (controller.isKeysLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ArrayComponent(items: controller.keys);
            }
          },
        ));
  }
}
