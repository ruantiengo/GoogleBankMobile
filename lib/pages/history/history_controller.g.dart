// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryController on _HistoryControllerBase, Store {
  late final _$transfersAtom =
      Atom(name: '_HistoryControllerBase.transfers', context: context);

  @override
  List<Transfer> get transfers {
    _$transfersAtom.reportRead();
    return super.transfers;
  }

  @override
  set transfers(List<Transfer> value) {
    _$transfersAtom.reportWrite(value, super.transfers, () {
      super.transfers = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HistoryControllerBase.isLoading', context: context);

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

  late final _$getTransactionsAsyncAction =
      AsyncAction('_HistoryControllerBase.getTransactions', context: context);

  @override
  Future<dynamic> getTransactions(BuildContext context, int id) {
    return _$getTransactionsAsyncAction
        .run(() => super.getTransactions(context, id));
  }

  late final _$_HistoryControllerBaseActionController =
      ActionController(name: '_HistoryControllerBase', context: context);

  @override
  void setIsLoading(bool stats) {
    final _$actionInfo = _$_HistoryControllerBaseActionController.startAction(
        name: '_HistoryControllerBase.setIsLoading');
    try {
      return super.setIsLoading(stats);
    } finally {
      _$_HistoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transfers: ${transfers},
isLoading: ${isLoading}
    ''';
  }
}
