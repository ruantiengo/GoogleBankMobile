import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_bank_mobile/pages/login/login_controller.dart';
import 'package:mobx/mobx.dart';

class GoogleAuthService {
  static final LoginPageController _myController = LoginPageController();

  static LoginPageController get myController => _myController;
}
