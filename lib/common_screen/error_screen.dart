import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/const/diments.dart';
import 'package:my_portfolio/route_configuration.dart';

Widget _content(BuildContext context) {
  final themeData = Theme.of(context);

  return ListView(
    padding: const EdgeInsets.all(kDefaultPadding),
    children: [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: kDefaultPadding * 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: kDefaultPadding),
              child: Text(
                '404',
                style: themeData.textTheme.displayMedium!
                    .copyWith(color: Colors.red),
              ),
            ),
            SizedBox(
              width: 300.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
                    child: Text(
                      "Page not found",
                      style: themeData.textTheme.titleLarge!.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 36.0,
                    width: 100.0,
                    child: ElevatedButton(
                      onPressed: () => GoRouter.of(context).go(RouteUri.home),
                      child: const Text("Home"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _content(context);
  }
}
