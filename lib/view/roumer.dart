import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roumer/controller/roumer.dart';
import 'package:roumer/view/before_login/base.dart';
import 'package:roumer/view/logined/base.dart';

class RoumerApp extends ConsumerWidget {
  RoumerApp({super.key});

  final _controllerProvider =
      Provider<RoumerAppController>((ref) => RoumerAppController());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.read(_controllerProvider);
    var hasAuthToken = ref.watch(controller.hasAuthTokenProvider);

    //show first demo
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: hasAuthToken.when<Widget>(
        loading: () => const Scaffold(
          body: Center(
            child: Text(
              "Roumer",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
              ),
            ),
          ),
        ),
        error: (error, stack) => const Text("error"),
        data: (isLogined) => isLogined ? HomePage() : BeforeLoginPage(),
      ),
    );
    // );
  }
}
