import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginPageController = _LoginPageControllerBase with _$LoginPageController;

abstract class _LoginPageControllerBase with Store {
  @observable
  var count = 0;

  @action
  increment() {
    count++;
  }
}
