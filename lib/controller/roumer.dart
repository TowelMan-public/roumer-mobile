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

  final canNewProcess = _canNewProcess;
}

final _hasAuthTokenProvider = FutureProvider<bool>((ref) async {
  var _secret = ref.read(secretProvider);
  ref.read(_canNewProcess.notifier).state = true;

  //TODO
  return true;
});

final _canNewProcess = StateProvider((ref) => true);
