// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_bank_mobile/pages/login/google_service.dart';
import 'package:google_bank_mobile/pages/pix/pix_controller.dart';
import 'package:google_bank_mobile/shared/appbar/app_bar.dart';
import 'package:google_bank_mobile/shared/styles.dart';

class NewKeyPage extends StatefulWidget {
  const NewKeyPage({super.key});

  @override
  State<NewKeyPage> createState() => _NewKeyPageState();
}

class _NewKeyPageState extends State<NewKeyPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    TextEditingController newKeyController = TextEditingController();

    final controller = PixPageController();
    final userController = GoogleAuthService.myController;

    return Scaffold(
      appBar: const GoogleAppBar(
        containBackButton: true,
        customText: "Adicionar chave",
      ).build(context),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: width * 0.8,
            child: TextFormField(
              controller: newKeyController,
              decoration: const InputDecoration(
                labelText: "Chave pix",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(blue))),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(grey)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.2,
          ),
          //      "isValidKey": true,
          // "addNewKey": false,
          // "title": "Erro ao adicionar chave",
          // "message": "Chave invalida."
          ElevatedButton(
              onPressed: () async {
                var res = await controller.createNewKey(
                    context, userController.userId!, newKeyController.text);

                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(res["title"]),
                        content: Text(res["message"]),
                        actions: [
                          ElevatedButton(
                            child: const Text('Ok, entendi.'),
                            onPressed: () {
                              // Código a ser executado quando o usuário confirmar
                              if (res["addNewKey"] == true) {
                                Navigator.popAndPushNamed(context, '/my-keys');
                              } else {
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ],
                      );
                    });
              },
              child: const Text("Criar nova chave"))
        ]),
      ),
    );
  }
}
