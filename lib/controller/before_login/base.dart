import 'package:roumer/controller/roumer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BeforeLoginController extends BaseRoumerController {
  //TODO

  late final childProvider = StateProvider((ref) => ChildInBeforeLogin.login);
}

enum ChildInBeforeLogin {
  login,
  signUp,
}

extension _ChildInBeforeLogin on ChildInBeforeLogin {
  ChildInBeforeLoginController getController(
      StateProvider<ChildInBeforeLogin> childProvider) {
    switch (this) {
      case ChildInBeforeLogin.login:
        // TODO: Handle this case.
        return ChildInBeforeLoginController(childProvider);
      case ChildInBeforeLogin.signUp:
        // TODO: Handle this case.
        return ChildInBeforeLoginController(childProvider);
    }
  }
}

class ChildInBeforeLoginController extends BaseRoumerController {
  final StateProvider<ChildInBeforeLogin> childProvider;

  ChildInBeforeLoginController(this.childProvider);

  //call on closing this Page delete loaded data without inited data.
  void onClosing() {
    //delete loaded data without inited data.
  }
}
