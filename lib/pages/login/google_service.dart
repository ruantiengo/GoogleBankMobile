import 'package:google_bank_mobile/pages/login/login_controller.dart';

class GoogleAuthService {
  static final LoginPageController _myController = LoginPageController();

  static LoginPageController get myController => _myController;
}
