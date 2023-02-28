import 'package:flutter/material.dart';
import 'package:google_bank_mobile/shared/appbar/app_bar.dart';

class PixAreaWidget extends StatefulWidget {
  const PixAreaWidget({super.key});

  @override
  State<PixAreaWidget> createState() => _PixAreaWidgetState();
}

class _PixAreaWidgetState extends State<PixAreaWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GoogleAppBar(containBackButton: true).build(context),
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.key),
                  label: Text("Minhas chaves")),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                  label: Text("Transferir")),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.key),
                  label: Text("Minhsa chaves")),
            ],
          ),
        ),
      ),
    );
  }
}
