// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginPageController on _LoginPageControllerBase, Store {
  late final _$isAuthenticatedAtom =
      Atom(name: '_LoginPageControllerBase.isAuthenticated', context: context);

  @override
  bool get isAuthenticated {
    _$isAuthenticatedAtom.reportRead();
    return super.isAuthenticated;
  }

  @override
  set isAuthenticated(bool value) {
    _$isAuthenticatedAtom.reportWrite(value, super.isAuthenticated, () {
      super.isAuthenticated = value;
    });
  }

  late final _$userEmailAtom =
      Atom(name: '_LoginPageControllerBase.userEmail', context: context);

  @override
  String? get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String? value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_LoginPageControllerBase.user', context: context);

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$userNameAtom =
      Atom(name: '_LoginPageControllerBase.userName', context: context);

  @override
  String? get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String? value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$isNewUserAtom =
      Atom(name: '_LoginPageControllerBase.isNewUser', context: context);

  @override
  bool? get isNewUser {
    _$isNewUserAtom.reportRead();
    return super.isNewUser;
  }

  @override
  set isNewUser(bool? value) {
    _$isNewUserAtom.reportWrite(value, super.isNewUser, () {
      super.isNewUser = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_LoginPageControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$accessTokenAtom =
      Atom(name: '_LoginPageControllerBase.accessToken', context: context);

  @override
  String? get accessToken {
    _$accessTokenAtom.reportRead();
    return super.accessToken;
  }

  @override
  set accessToken(String? value) {
    _$accessTokenAtom.reportWrite(value, super.accessToken, () {
      super.accessToken = value;
    });
  }

  late final _$signInAsyncAction =
      AsyncAction('_LoginPageControllerBase.signIn', context: context);

  @override
  Future<void> signIn(BuildContext context) {
    return _$signInAsyncAction.run(() => super.signIn(context));
  }

  late final _$signOutAsyncAction =
      AsyncAction('_LoginPageControllerBase.signOut', context: context);

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  late final _$_LoginPageControllerBaseActionController =
      ActionController(name: '_LoginPageControllerBase', context: context);

  @override
  void setAccessToken(String token) {
    final _$actionInfo = _$_LoginPageControllerBaseActionController.startAction(
        name: '_LoginPageControllerBase.setAccessToken');
    try {
      return super.setAccessToken(token);
    } finally {
      _$_LoginPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_LoginPageControllerBaseActionController.startAction(
        name: '_LoginPageControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_LoginPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isAuthenticated: ${isAuthenticated},
userEmail: ${userEmail},
user: ${user},
userName: ${userName},
isNewUser: ${isNewUser},
isLoading: ${isLoading},
accessToken: ${accessToken}
    ''';
  }
}
