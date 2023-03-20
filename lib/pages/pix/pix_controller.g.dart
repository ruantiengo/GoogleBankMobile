// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pix_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PixPageController on _PixPageControllerBase, Store {
  late final _$keysAtom =
      Atom(name: '_PixPageControllerBase.keys', context: context);

  @override
  List<KeyPix> get keys {
    _$keysAtom.reportRead();
    return super.keys;
  }

  @override
  set keys(List<KeyPix> value) {
    _$keysAtom.reportWrite(value, super.keys, () {
      super.keys = value;
    });
  }

  late final _$isKeysLoadingAtom =
      Atom(name: '_PixPageControllerBase.isKeysLoading', context: context);

  @override
  bool get isKeysLoading {
    _$isKeysLoadingAtom.reportRead();
    return super.isKeysLoading;
  }

  @override
  set isKeysLoading(bool value) {
    _$isKeysLoadingAtom.reportWrite(value, super.isKeysLoading, () {
      super.isKeysLoading = value;
    });
  }

  late final _$isSendingPixAtom =
      Atom(name: '_PixPageControllerBase.isSendingPix', context: context);

  @override
  bool get isSendingPix {
    _$isSendingPixAtom.reportRead();
    return super.isSendingPix;
  }

  @override
  set isSendingPix(bool value) {
    _$isSendingPixAtom.reportWrite(value, super.isSendingPix, () {
      super.isSendingPix = value;
    });
  }

  late final _$verifyPixIsLoadingAtom =
      Atom(name: '_PixPageControllerBase.verifyPixIsLoading', context: context);

  @override
  bool get verifyPixIsLoading {
    _$verifyPixIsLoadingAtom.reportRead();
    return super.verifyPixIsLoading;
  }

  @override
  set verifyPixIsLoading(bool value) {
    _$verifyPixIsLoadingAtom.reportWrite(value, super.verifyPixIsLoading, () {
      super.verifyPixIsLoading = value;
    });
  }

  late final _$isInfoPixConfirmLoadingAtom = Atom(
      name: '_PixPageControllerBase.isInfoPixConfirmLoading', context: context);

  @override
  bool get isInfoPixConfirmLoading {
    _$isInfoPixConfirmLoadingAtom.reportRead();
    return super.isInfoPixConfirmLoading;
  }

  @override
  set isInfoPixConfirmLoading(bool value) {
    _$isInfoPixConfirmLoadingAtom
        .reportWrite(value, super.isInfoPixConfirmLoading, () {
      super.isInfoPixConfirmLoading = value;
    });
  }

  late final _$getKeysAsyncAction =
      AsyncAction('_PixPageControllerBase.getKeys', context: context);

  @override
  Future<dynamic> getKeys(BuildContext context, int id) {
    return _$getKeysAsyncAction.run(() => super.getKeys(context, id));
  }

  late final _$createNewKeyAsyncAction =
      AsyncAction('_PixPageControllerBase.createNewKey', context: context);

  @override
  Future<dynamic> createNewKey(BuildContext context, int id, String key) {
    return _$createNewKeyAsyncAction
        .run(() => super.createNewKey(context, id, key));
  }

  late final _$verifyInformationsPixAsyncAction = AsyncAction(
      '_PixPageControllerBase.verifyInformationsPix',
      context: context);

  @override
  Future<dynamic> verifyInformationsPix(
      BuildContext context, int senderId, String receiverKey, String value) {
    return _$verifyInformationsPixAsyncAction.run(() =>
        super.verifyInformationsPix(context, senderId, receiverKey, value));
  }

  late final _$sendPixAsyncAction =
      AsyncAction('_PixPageControllerBase.sendPix', context: context);

  @override
  Future<dynamic> sendPix(
      BuildContext context, int senderId, int receiverId, String value) {
    return _$sendPixAsyncAction
        .run(() => super.sendPix(context, senderId, receiverId, value));
  }

  @override
  String toString() {
    return '''
keys: ${keys},
isKeysLoading: ${isKeysLoading},
isSendingPix: ${isSendingPix},
verifyPixIsLoading: ${verifyPixIsLoading},
isInfoPixConfirmLoading: ${isInfoPixConfirmLoading}
    ''';
  }
}
