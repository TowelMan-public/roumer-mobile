// ignore_for_file: constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:roumer/unwrap.dart';

final secretProvider = Provider((_) => _Secret());

//singleton
class _Secret {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const _ACCESS_TOKEN = "ACCESS_TOKEN";
  static const _REFLESH_TOKEN = "REFLESH_TOKEN";
  static const _TIME_OG_ACQUISITION = "TIME_OF_ACQUISITION";

  Future<int?> getTimeOfAcquisition() async {
    if (await _storage.containsKey(key: _TIME_OG_ACQUISITION)) {
      return null;
    } else {
      var value = await _storage.read(key: _TIME_OG_ACQUISITION);
      return value == null ? null : int.parse(value);
    }
  }

  Future<void> deleteTimeOfAcquisition() async {
    await _storage.delete(key: _TIME_OG_ACQUISITION);
  }

  Future<void> setTimeOfAcquisition(int time) async {
    await _storage.write(key: _TIME_OG_ACQUISITION, value: time.toString());
  }

  Future<String> getAccessToken() async {
    return unwrapNull(await _storage.read(key: _ACCESS_TOKEN));
  }

  Future<void> setAccessToken(String token) async {
    await _storage.write(key: _ACCESS_TOKEN, value: token);
  }

  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _ACCESS_TOKEN);
  }

  Future<String> getRefleshToken() async {
    return unwrapNull(await _storage.read(key: _REFLESH_TOKEN));
  }

  Future<void> setRefleshToken(String token) async {
    await _storage.write(key: _REFLESH_TOKEN, value: token);
  }

  Future<void> deleteRefleshToken() async {
    await _storage.delete(key: _REFLESH_TOKEN);
  }
}
