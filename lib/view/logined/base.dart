import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  final countProvider = StateProvider((ref) {
    return 0;
  });

  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    var t = ref.watch(countProvider);
    ref.read(countProvider.notifier).state++;
    throw UnimplementedError();
  }
}
