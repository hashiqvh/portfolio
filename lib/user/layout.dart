import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/utils.dart';

class LayoutHomeWidget extends StatelessWidget {
  final int flex;
  final Widget child;
  final Screens currentScreen;
  const LayoutHomeWidget(
      {super.key,
      required this.currentScreen,
      required this.child,
      this.flex = 1});

  @override
  Widget build(BuildContext context) {
    return currentScreen != Screens.laptop
        ? child
        : Expanded(
            flex: flex,
            child: child,
          );
  }
}

class LayoutScreen extends StatelessWidget {
  final List<Widget> children;
  final Screens currentScreen;
  const LayoutScreen(
      {super.key, required this.currentScreen, required this.children});

  @override
  Widget build(BuildContext context) {
    return currentScreen != Screens.laptop
        ? SingleChildScrollView(
            child: Column(
              children: children,
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          );
  }
}

class LayoutScreenExperience extends StatelessWidget {
  final List<Widget> children;
  final Screens currentScreen;
  const LayoutScreenExperience(
      {super.key, required this.currentScreen, required this.children});

  @override
  Widget build(BuildContext context) {
    return currentScreen != Screens.laptop
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          );
  }
}
