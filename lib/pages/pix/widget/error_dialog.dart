import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Título do diálogo'),
        content: const Text('Conteúdo do diálogo'),
        actions: [
          ElevatedButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ]);
  }
}
