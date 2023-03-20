// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_bank_mobile/pages/login/google_service.dart';
import 'package:google_bank_mobile/pages/pix/interface/key.dart';
import 'package:google_bank_mobile/pages/pix/validators/cpf_validator.dart';
import 'package:google_bank_mobile/pages/pix/validators/email_vallidator.dart';
import 'package:google_bank_mobile/pages/pix/validators/phone_validator.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'pix_controller.g.dart';

class PixPageController = _PixPageControllerBase with _$PixPageController;

abstract class _PixPageControllerBase with Store {
  @observable
  List<KeyPix> keys = [];

  @observable
  bool isKeysLoading = false;

  @observable
  bool isSendingPix = false;

  @observable
  bool verifyPixIsLoading = false;

  @observable
  bool isInfoPixConfirmLoading = false;

  bool containsOnlyNumbers(String str) {
    final pattern = RegExp(r'^\d+$');
    return pattern.hasMatch(str);
  }

  @action
  Future getKeys(BuildContext context, int id) async {
    try {
      isKeysLoading = true;
      final authController = GoogleAuthService.myController;
      final accessToken = authController.accessToken!;
      var res = await http.get(
          Uri.parse("http://192.168.5.129:3000/key/user/$id"),
          headers: {"Authorization": "Bearer $accessToken"});
      final jsonResponse = jsonDecode(res.body);
      keys = (jsonResponse as List<dynamic>)
          .map((json) => KeyPix.fromJson(json))
          .toList();
      isKeysLoading = false;
    } catch (error) {
      isKeysLoading = false;
    }
  }

  @action
  Future createNewKey(BuildContext context, int id, String key) async {
    final authController = GoogleAuthService.myController;
    final accessToken = authController.accessToken!;
    String type = "";

    final isCPF = isCPFValid(key);
    if (isCPF) type = 'CPF';
    final isPhone = isPhoneValid(key);
    if (isPhone) type = 'PHONE';
    final isEmail = isEmailValid(key);
    if (isEmail) type = 'EMAIL';

    try {
      if (type.isEmpty) {
        throw Exception("Valor digitado não é um CPF, EMAIL ou TELEFONE");
      }

      var body = {
        "ownerId": authController.userId!,
        "value": key,
        "type": type
      };
      String jsonString = jsonEncode(body);
      var res = await http.post(
          Uri.parse("https://google-bank-api-production.up.railway.app/key"),
          body: jsonString,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            "Authorization": "Bearer $accessToken"
          });

      if (res.statusCode != 201) {
        return {
          "isValidKey": true,
          "addNewKey": false,
          "title": "Erro ao adicionar chave",
          "message": res.body
        };
      }
      return {
        "isValidKey": true,
        "addNewKey": true,
        "title": "Chave cadastrada com sucesso!",
        "message": ""
      };
    } catch (error) {
      return {
        "isValidKey": false,
        "addNewKey": false,
        "title": "Erro ao adicionar chave",
        "message": error.toString()
      };
    }
  }

  @action
  Future verifyInformationsPix(BuildContext context, int senderId,
      String receiverKey, String value) async {
    try {
      verifyPixIsLoading = true;

      isInfoPixConfirmLoading = true;
      num amount = num.parse(value);
      final authController = GoogleAuthService.myController;
      final accessToken = authController.accessToken!;
      var fetchReceiver = await http.get(
          Uri.parse("http://192.168.5.129:3000/key/$receiverKey"),
          headers: {"Authorization": "Bearer $accessToken"});
      final receiver = jsonDecode(fetchReceiver.body);

      verifyPixIsLoading = false;
      if (receiverKey == "") {
        return {"title": "Chave vazia", "message": "Não encontrado"};
      }
      if (value == "") {
        return {
          "title": "Erro. Valor de envio invaalido",
          "message": "Digite um valor vallido a enviar"
        };
      }
      if (receiver.isEmpty) {
        return {
          "title": "Chave pix não cadastrada",
          "message": "Não encontrado"
        };
      }
      // var res = await http.post(
      //     Uri.parse(
      //         "https://google-bank-api-production.up.railway.app/transfer"),
      //     body: {
      //       "senderId": senderId,
      //       "receiverId": receiver["id"],
      //       "value": value
      //     },
      //     headers: {
      //       "Authorization": "Bearer $accessToken"
      //     });
      var balance = authController.balance;
      if (balance < amount) {
        return {
          "title": "Valor inválido.",
          "message":
              "O valor que está tentando enviar é maior que o valor que você tem na conta."
        };
      }
      var receiverName = receiver[0]["owner"]["name"];
      var receiverId = receiver[0]["user_id"];

      isInfoPixConfirmLoading = false;
      return {
        "title": "ok",
        "message": "",
        "receiverId": receiverId,
        "receiverName": receiverName
      };
      // if (res.statusCode == 200) {
      //   return {"title": "Chave cadastrada com sucesso.", "message": ""};
      // } else {
      //   return {"title": "Erro.", "message": res.body};
      // }
    } catch (error) {
      isInfoPixConfirmLoading = false;
      return {"title": "Erro.", "message": error.toString()};
    }
  }

  @action
  Future sendPix(
      BuildContext context, int senderId, int receiverId, String value) async {
    try {
      isSendingPix = true;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Container(
                  color: Colors.transparent,
                  child: Center(
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: const CircularProgressIndicator())))));
      num amount = num.parse(value);
      final authController = GoogleAuthService.myController;
      final accessToken = authController.accessToken!;

      var body = {
        "senderId": senderId,
        "receiverId": receiverId,
        "value": amount
      };
      String jsonData = jsonEncode(body);
      var response = await http.post(
          Uri.parse("http://192.168.5.129:3000/transfer"),
          body: jsonData,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            "Authorization": "Bearer $accessToken"
          });
      isSendingPix = false;
      final res = jsonDecode(response.body);
      Navigator.pop(context);
      if (response.statusCode == 400) {
        return {"title": "Erro", "message": res[0]};
      }
      authController.balance -= amount;
      return {"title": "Transferência enviada com sucesso", "message": ""};
    } catch (error) {
      return {"title": "Erro.", "message": error.toString()};
    }
  }
}
