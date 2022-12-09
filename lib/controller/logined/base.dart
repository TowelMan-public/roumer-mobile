import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roumer/controller/roumer.dart';
import 'package:roumer/provider_builder/listen_state.dart';
import 'package:roumer/unwrap.dart';

enum TabInHome {
  routine,
  plan,
  sns,
  statistics,
  setting,
}

extension _TabInHome on TabInHome {
  ChildInHomeController getController(
      ChangeNotifierProvider<ListenStateNotifier<TabInHome>> tabProvider) {
    switch (this) {
      case TabInHome.routine:
        // TODO: Handle this case.
        return ChildInHomeController(tabProvider);
      case TabInHome.plan:
        // TODO: Handle this case.
        return ChildInHomeController(tabProvider);
      case TabInHome.sns:
        // TODO: Handle this case.
        return ChildInHomeController(tabProvider);
      case TabInHome.statistics:
        // TODO: Handle this case.
        return ChildInHomeController(tabProvider);
      case TabInHome.setting:
        // TODO: Handle this case.
        return ChildInHomeController(tabProvider);
    }
  }
}

class HomeController extends BaseRoumerController {
  final Map<TabInHome, ChildInHomeController> controllerInTab = {};

  late final tabProvider = buildListenStateProvider(
    TabInHome.routine,
    onSetting: (before, after) {
      if (before == after) {
        return false;
      } else {
        unwrapNull(controllerInTab[before]).onClosing();
        unwrapNull(controllerInTab[after]).reflesh();
        return true;
      }
    },
  );

  late final FutureProvider<void> loadProvider = FutureProvider(
    (ref) => _load(ref),
  );

  HomeController() {
    for (var tab in TabInHome.values) {
      controllerInTab.addAll({
        tab: tab.getController(tabProvider),
      });
    }
  }

  Future<void> _load(FutureProviderRef ref) async {
    var futureList = <Future<void>>[];

    for (var tab in TabInHome.values) {
      var childController = unwrapNull(controllerInTab[tab]);
      if (!childController.isInited) {
        futureList.add(childController.init());
      }
    }

    Future.wait(futureList).then(
      (_) => ref.read(canNewProcess.notifier).state = true,
      onError: (_) =>
          ref.read(canNewProcess.notifier).state = true, //TODO error
    );
  }
}

class ChildInHomeController extends BaseRoumerController {
  final ChangeNotifierProvider<ListenStateNotifier<TabInHome>> tabProvider;
  final hasNoticeProvider = StateProvider((ref) => false);

  var _isInited = false;
  bool get isInited => _isInited;

  ChildInHomeController(this.tabProvider);

  //init (load data needed by HomePage)
  Future<void> init() async {
    _isInited = true;
  }

  //delete loaded data without inited data and reinitialization init
  void reflesh() {
    _isInited = false;
  }

  //call on closing this Page delete loaded data without inited data.
  void onClosing() {
    //delete loaded data without inited data.
  }
}
