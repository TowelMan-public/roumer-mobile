import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roumer/controller/logined/base.dart';
import 'package:roumer/view/compornent/layout.dart';

class HomePage extends ConsumerWidget {
  final _controllerProvider =
      StateProvider<HomeController>((ref) => HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.read(_controllerProvider);
    var tabState = ref.watch(controller.tabProvider);

    return FlexLayout(
      direction: FlexDirection.column,
      builder: (constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          showInitialPage(constraints),
          FlexItem(
            direction: FlexDirection.row,
            size: constraints.sideLength(55),
            builder: (constraints) => Container(
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }

  FlexItem showInitialPage(FlexLayoutConstraints constraints) {
    return FlexItem(
      direction: FlexDirection.column,
      size: constraints.extend(),
      builder: (constraints) => Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
      ),
    );
  }
}
