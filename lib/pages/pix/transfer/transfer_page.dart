// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_bank_mobile/pages/login/google_service.dart';
import 'package:google_bank_mobile/pages/pix/pix_controller.dart';
import 'package:google_bank_mobile/pages/pix/transfer/confirm_transfer.dart';

import 'package:google_bank_mobile/shared/appbar/app_bar.dart';
import 'package:google_bank_mobile/shared/styles.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  TextEditingController keyController = TextEditingController();
  TextEditingController valueController = TextEditingController(text: '0.00');

  final controller = PixPageController();
  final userController = GoogleAuthService.myController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const GoogleAppBar(
          containBackButton: true,
          customText: "Enviar pix",
        ).build(context),
        body: Observer(builder: (context) {
          if (controller.verifyPixIsLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: keyController,
                  decoration: const InputDecoration(
                    labelText: "Chave pix",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Color(blue))),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Color(grey)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: valueController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: "Valor",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Color(blue))),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Color(grey)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () async {
                      var res = await controller.verifyInformationsPix(
                        context,
                        userController.userId!,
                        keyController.text,
                        valueController.text,
                      );

                      if (res["title"].toString().compareTo("ok") != 0) {
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
                                      valueController.text = valueController
                                          .text
                                          .replaceFirst(',', '.');
                                      if (res["addNewKey"] == true) {
                                        Navigator.pop(context);
                                      } else {
                                        Navigator.of(context).pop();
                                      }
                                    },
                                  ),
                                ],
                              );
                            });
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmTransferPage(
                                    senderId: userController.userId!,
                                    senderName: userController.userName!,
                                    receiverId: res["receiverId"],
                                    receiverName: res["receiverName"],
                                    value: valueController.text)));
                      }
                    },
                    child: const Text("Enviar transferência"))
              ],
            ),
          );
        }));
  }
}
