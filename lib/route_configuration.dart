import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:my_portfolio/admin/UI/about/about_screen.dart';
import 'package:my_portfolio/admin/UI/admin_layout.dart';
import 'package:my_portfolio/admin/UI/experience/work_experience.dart';
import 'package:my_portfolio/admin/UI/intro/admin_intro.dart';
import 'package:my_portfolio/admin/UI/project/admin_project.dart';
import 'package:my_portfolio/admin/UI/screens/admin_login.dart';
import 'package:my_portfolio/common_screen/error_screen.dart';
import 'package:my_portfolio/core/provider/user_data_provider.dart';
import 'package:my_portfolio/user/UI/home_screen.dart';

const List<String> restrictedRoutes = [
  RouteUri.admin,
  RouteUri.adminIntro,
  RouteUri.adminAbout,
  RouteUri.adminExperience,
  RouteUri.adminProjects,
];

const List<String> unrestrictedRoutes = [
  RouteUri.error404,
  RouteUri.home,
  RouteUri.intro,
  RouteUri.proejcts,
  RouteUri.experence,
  RouteUri.login,
];

GoRouter appRouter(UserDataProvider userDataProvider) {
  return GoRouter(
    initialLocation: RouteUri.home,
    errorPageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const ErrorScreen(),
    ),
    routes: [
      GoRoute(
        path: RouteUri.home,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const UserHomeScreen(),
        ),
        // routes: [

        // ],
      ),
      // GoRoute(
      //   path: '/admin/:fid',
      //   builder: (context, state) {
      //     String fid = state.pathParameters['fid']!;
      //     if (fid.isEmpty) {
      //       fid = "intro";
      //     }
      //     return AdminLayout(
      //       route: fid,
      //       key: state.pageKey,
      //     );
      //   },
      // ),
      GoRoute(
          path: RouteUri.admin,
          pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey,
                child: const AdminIntroScreen(),
              ),
          routes: [
            GoRoute(
              path: RouteUri.adminIntro,
              pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey,
                child: AdminLayout(),
              ),
            ),
            GoRoute(
              path: RouteUri.adminAbout,
              pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey,
                child: const AdminAboutUsScreen(),
              ),
            ),
            GoRoute(
              path: RouteUri.adminExperience,
              pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey,
                child: const AdminWorkExperienceScreen(),
              ),
            ),
            GoRoute(
              path: RouteUri.adminProjects,
              pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey,
                child: const AdminProjectsScreen(),
              ),
            ),
          ]),

      GoRoute(
        path: RouteUri.login,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: AdminLogin(),
        ),
      ),
    ],
    redirect: (context, state) {
      if (unrestrictedRoutes.contains(state.matchedLocation)) {
        return state.matchedLocation;
      } else if (restrictedRoutes.contains(state.matchedLocation)) {
        // Is public route.
        if (userDataProvider.isUserLoggedIn()) {
          log("logged in");
          // User is logged in, redirect to home page.
          return RouteUri.admin;
        } else {
          log("logged put");
          // User is not logged in, redirect to login page.
          return RouteUri.login;
        }
      }

      return null;
    },
  );
}

class RouteUri {
  //admin routes
  static const String admin = '/admin';
  static const String adminIntro = 'intro';
  static const String adminAbout = 'about';
  static const String adminExperience = 'experience';
  static const String adminProjects = 'projects';
  static const String login = '/login';
  static const String error404 = '/404';
//user routes
  static const String intro = '/intro';
  static const String about = '/about';
  static const String home = '/';
  static const String experence = '/experience';
  static const String proejcts = '/projects';
}
