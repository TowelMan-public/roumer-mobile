import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roumer/secret.dart';

class RoumerAppController extends BaseRoumerController {
  final hasAuthTokenProvider = _hasAuthTokenProvider;
}

class BaseRoumerController {
  Future<String> accessToken(WidgetRef ref) async {
    var _secret = ref.read(secretProvider);

    //TODO
    // ignore: unused_result
    // ref.refresh(_hasAuthTokenProvider);

    return "";
  }

  var onWillPop = () async => false;
}

final _hasAuthTokenProvider = FutureProvider<bool>((ref) async {
  var _secret = ref.read(secretProvider);

  //TODO
  return true;
});
