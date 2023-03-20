import 'package:flutter/material.dart';
import 'package:google_bank_mobile/pages/login/login_page.dart';
import 'package:google_bank_mobile/pages/main/main_page.dart';
import 'package:google_bank_mobile/pages/pix/my_keys/my_keys.dart';
import 'package:google_bank_mobile/pages/pix/new_key/new_key_page.dart';
import 'package:google_bank_mobile/pages/pix/transfer/transfer_page.dart';
import 'package:google_bank_mobile/shared/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const LoginPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/main': (context) => const MainPage(),
        '/new-key': (context) => const NewKeyPage(),
        '/my-keys': (context) => const MyKeysPage(),
        '/transfer': (context) => const TransferPage()
      },
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: const Color(blue)),
    );
  }
}
