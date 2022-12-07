import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget child;
  final bool isShowingProgress;

  const BasePage({
    required this.child,
    this.isShowingProgress = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView(
      constraints: const BoxConstraints.expand(),
      isShowingProgress: isShowingProgress,
      child: child,
    );
  }
}

class BaseView extends StatelessWidget {
  final BoxConstraints constraints;
  final Widget child;
  final bool isShowingProgress;

  const BaseView({
    required this.constraints,
    required this.child,
    this.isShowingProgress = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: constraints,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          child,
          if (isShowingProgress)
            ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const CircularProgressIndicator(
                  strokeWidth: 10,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
