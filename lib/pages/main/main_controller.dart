// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'main_controller.g.dart';

class MainPageController = _MainPageControllerBase with _$MainPageController;

abstract class _MainPageControllerBase with Store {}
