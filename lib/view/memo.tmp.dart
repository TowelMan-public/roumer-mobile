import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class BasePage extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }

// }

// class BasePageState

class Test extends ConsumerWidget {
  final countProvider = StateProvider((ref) {
    return 0;
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    var t = ref.watch(countProvider);
    ref.read(countProvider.notifier).state++;
    throw UnimplementedError();
  }
}

extension _Test on Test {
  static int test() {
    return 1;
  }
}

class T {
  var i = _Test.test();
}

final _testProvider = StateProvider((ref) {
  return 0;
});

// 状態管理の方、インスタンス作るよ
final myNotifierProvider = ChangeNotifierProvider((_) {
  return MyNotifier();
});

// そのモデルとなるクラス
// ChangeNotifierをextendsしないとダメだよ
class MyNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

//AIDに関して
class TestController {
  final testProvider = _testProvider; //single
  final int aId;

  late StateProvider<String> detailsProvider;

  TestController(this.aId) {
    detailsProvider = StateProvider((ref) {
      //Future<Model系>のビジネスロジックを呼び出し、戻す
      return aId.toString();
    });
  }
}
