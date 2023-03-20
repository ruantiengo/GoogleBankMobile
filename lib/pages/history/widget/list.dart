import 'package:flutter/material.dart';
import 'package:google_bank_mobile/pages/history/interface/transfer.dart';
import 'package:google_bank_mobile/pages/pix/interface/key.dart';
import 'package:google_bank_mobile/shared/styles.dart';

class HistoryList extends StatelessWidget {
  final List<Transfer> items;

  const HistoryList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final isSender = items[index].role.compareTo("sender") == 0;
        return Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("De: " + items[index].senderName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          )),
                      Text(
                        "Para: " + items[index].receiverName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(items[index].value.toString(),
                      style: TextStyle(
                        fontSize: 22,
                        color: isSender ? const Color(red) : const Color(green),
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ))
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
