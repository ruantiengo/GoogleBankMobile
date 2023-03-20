// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_bank_mobile/pages/history/interface/transfer.dart';
import 'package:google_bank_mobile/pages/login/google_service.dart';
import 'package:http/http.dart' as http;

import 'package:mobx/mobx.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  @observable
  List<Transfer> transfers = [];

  @observable
  bool isLoading = false;

  _HistoryControllerBase(BuildContext context, int id) {
    initState(context, id);
  }
  Future<void> initState(BuildContext context, int id) async {
    await getTransactions(context, id);
  }

  @action
  Future getTransactions(BuildContext context, int id) async {
    try {
      isLoading = true;
      var userController = GoogleAuthService.myController;
      var url =
          "http://192.168.5.129:7071/api/report?userId=${userController.userId}";

      var res = await http.get(Uri.parse(url),
          headers: {"Authorization": "Bearer ${userController.accessToken}"});

      dynamic jsonResponse = jsonDecode(res.body);
      final transfersDecoded = (jsonResponse as List<dynamic>)
          .map((json) => Transfer.fromJson(json))
          .toList();
      isLoading = false;
      transfers = transfersDecoded;
      setIsLoading(false);
    } catch (error) {
      setIsLoading(false);
      print("Error");
    }
  }

  @action
  void setIsLoading(bool stats) {
    isLoading = stats;
  }
}
