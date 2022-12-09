import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// onGetting and onSetting: if return true, run notifyListeners(), else not run.
ChangeNotifierProvider<ListenStateNotifier<T>> buildListenStateProvider<T>(
  T state, {
  bool Function(T value)? onGetting,
  bool Function(T before, T after)? onSetting,
}) {
  return ChangeNotifierProvider((_) {
    return ListenStateNotifier(
      state,
      onGetting: onGetting,
      onSetting: onSetting,
    );
  });
}

class ListenStateNotifier<T> extends ChangeNotifier {
  T _state;
  late final bool Function(T value)? _onGetting;
  late final bool Function(T before, T after)? _onSetting;

  /// onGetting and onSetting: if return true, run notifyListeners(), else not run.
  ListenStateNotifier(
    this._state, {
    final bool Function(T value)? onGetting,
    final bool Function(T before, T after)? onSetting,
  }) {
    _onGetting = onGetting;
    _onSetting = onSetting;
  }

  T get state {
    if ((_onGetting ?? (_) => false)(_state)) {
      notifyListeners();
    }
    return _state;
  }

  set state(T value) {
    var before = _state;
    _state = value;
    if ((_onSetting ?? (_, __) => false)(before, _state)) {
      notifyListeners();
    }
  }
}
