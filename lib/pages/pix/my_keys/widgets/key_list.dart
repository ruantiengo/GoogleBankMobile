import 'package:flutter/material.dart';
import 'package:google_bank_mobile/pages/pix/interface/key.dart';
import 'package:google_bank_mobile/pages/pix/validators/cpf_formatter.dart';

class ArrayComponent extends StatelessWidget {
  final List<KeyPix> items;

  const ArrayComponent({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    items[index].type,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      items[index].type.compareTo("CPF") == 0
                          ? formatCPF(items[index].value)
                          : items[index].value,
                      style: const TextStyle(
                        fontSize: 22,
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
