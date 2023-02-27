import 'package:mobx/mobx.dart';

part 'main_controller.g.dart';

class MainPageController = _MainPageControllerBase with _$MainPageController;

abstract class _MainPageControllerBase with Store {
  @observable
  late int teste;

  @action
  void setTest(int i) {
    teste = i;
  }
}
