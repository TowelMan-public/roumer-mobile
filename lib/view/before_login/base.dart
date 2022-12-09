import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roumer/controller/before_login/base.dart';
import 'package:roumer/view/compornent/layout.dart';

class BeforeLoginPage extends ConsumerWidget {
  final _controllerProvider =
      StateProvider<BeforeLoginController>((ref) => BeforeLoginController());

  BeforeLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.read(_controllerProvider);
    var child = ref.watch(controller.childProvider);

    return FlexLayout(
      direction: FlexDirection.column,
      builder: (constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FlexItem(
            direction: FlexDirection.row,
            size: constraints.sideLength(55),
            builder: (constraints) => Container(
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
            ),
          ),
          showInitialPage(constraints),
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
