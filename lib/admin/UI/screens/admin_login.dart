import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/provider/user_data_provider.dart';
import 'package:my_portfolio/route_configuration.dart';
import 'package:provider/provider.dart';

class AdminLogin extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AdminLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 400,
                decoration: const BoxDecoration(
                    color: Color(0xFF2a2b38),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://s3-us-west-2.amazonaws.com/s.cdpn.io/1462889/pat.svg"))),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Login",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: const Color(0xff1f2029),
                        child: Center(
                          child: TextField(
                            controller: userNameController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  bottom: 20,
                                  top: 20), // add padding to adjust text
                              isDense: true,
                              hintText: "User name",
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    top: 15), // add padding to adjust icon
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 15.0),
                                  child: Icon(Icons.person),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: const Color(0xff1f2029),
                        child: Center(
                          child: TextField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  bottom: 20,
                                  top: 20), // add padding to adjust text
                              isDense: true,
                              hintText: "Password",
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    top: 15), // add padding to adjust icon
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 15.0),
                                  child: Icon(Icons.password),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (userNameController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              const snackBar = SnackBar(
                                content:
                                    Text('Enter currect password or password'),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              if (userNameController.text == "admin" &&
                                  passwordController.text == "password") {
                                Future(() => context
                                    .read<UserDataProvider>()
                                    .setUserDataAsync(
                                      username: userNameController.text,
                                    ));

                                GoRouter.of(context).go(RouteUri.admin);
                              }
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
