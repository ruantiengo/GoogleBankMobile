// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainPageController on _MainPageControllerBase, Store {
  late final _$testeAtom =
      Atom(name: '_MainPageControllerBase.teste', context: context);

  @override
  int get teste {
    _$testeAtom.reportRead();
    return super.teste;
  }

  @override
  set teste(int value) {
    _$testeAtom.reportWrite(value, super.teste, () {
      super.teste = value;
    });
  }

  late final _$_MainPageControllerBaseActionController =
      ActionController(name: '_MainPageControllerBase', context: context);

  @override
  void setTest(int i) {
    final _$actionInfo = _$_MainPageControllerBaseActionController.startAction(
        name: '_MainPageControllerBase.setTest');
    try {
      return super.setTest(i);
    } finally {
      _$_MainPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
teste: ${teste}
    ''';
  }
}
