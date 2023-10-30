import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/const.dart';
import 'package:my_portfolio/core/provider/about_provider.dart';
import 'package:my_portfolio/core/provider/data_provider.dart';
import 'package:my_portfolio/core/provider/intro_provider.dart';
import 'package:my_portfolio/core/provider/project_provider.dart';
import 'package:my_portfolio/core/provider/skills_provider.dart';
import 'package:my_portfolio/core/provider/work_experience_provider.dart';
import 'package:my_portfolio/firebase_options.dart';
import 'package:my_portfolio/route_configuration.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setPathUrlStrategy(); //this removes the '#' from my url

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoRouter? _appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _appRouter ??= appRouter();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(
            create: (context) => DataProvider()),
        ChangeNotifierProvider<IntroProvider>(
            create: (context) => IntroProvider()),
        ChangeNotifierProvider<AboutUsProvider>(
            create: (context) => AboutUsProvider()),
        ChangeNotifierProvider<SkillsProvider>(
            create: (context) => SkillsProvider()),
        ChangeNotifierProvider<WorkExperienceProvider>(
            create: (context) => WorkExperienceProvider()),
        ChangeNotifierProvider<ProjectsProvider>(
            create: (context) => ProjectsProvider()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationProvider: _appRouter!.routeInformationProvider,
          routeInformationParser: _appRouter!.routeInformationParser,
          routerDelegate: _appRouter!.routerDelegate,
          title: 'Flutter Demo',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: secondaryColor,
          ),
        );
      }),
    );
  }
}
