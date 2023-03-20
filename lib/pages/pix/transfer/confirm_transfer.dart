// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_bank_mobile/pages/pix/pix_controller.dart';
import 'package:google_bank_mobile/shared/appbar/app_bar.dart';
import 'package:intl/intl.dart';

class ConfirmTransferPage extends StatefulWidget {
  final int senderId;
  final String senderName;
  final int receiverId;
  final String receiverName;
  final String value;
  const ConfirmTransferPage(
      {super.key,
      required this.senderId,
      required this.senderName,
      required this.receiverId,
      required this.receiverName,
      required this.value});

  @override
  State<ConfirmTransferPage> createState() => _ConfirmTransferPageState();
}

class _ConfirmTransferPageState extends State<ConfirmTransferPage> {
  var formatoReais = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    var controller = PixPageController();
    return Scaffold(
      appBar: const GoogleAppBar(
        containBackButton: true,
        customText: "Confirmar pagamento",
      ).build(context),
      body: Observer(builder: (context) {
        if (controller.isSendingPix) {
          return Center(child: const CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(60.0, 0, 60, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "De: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.senderName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Para: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.receiverName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Valor: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      formatoReais.format(num.parse(widget.value)),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () async {
                      var res = await controller.sendPix(context,
                          widget.senderId, widget.receiverId, widget.value);
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
                                    if (res["title"] ==
                                        "Transferência enviada com sucesso") {
                                      Navigator.popAndPushNamed(
                                          context, '/main');
                                    } else {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: const Text("Confirmar transferência"))
              ]),
        );
      }),
    );
  }
}
