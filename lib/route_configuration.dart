import 'package:go_router/go_router.dart';
import 'package:my_portfolio/common_screen/error_screen.dart';
import 'package:my_portfolio/user/UI/home_screen.dart';

const List<String> publicRoutes = [
  // RouteUri.login, // Enable this line for actual authentication flow.
  // RouteUri.register, // Enable this line for actual authentication flow.
];

const List<String> unrestrictedRoutes = [
  RouteUri.error404,
];

GoRouter appRouter() {
  return GoRouter(
    initialLocation: RouteUri.home,
    errorPageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const ErrorScreen(),
    ),
    routes: [
      // GoRoute(
      //   path: RouteUri.home,
      //   redirect: (context, state) => RouteUri.adminIntro,
      // ),
      GoRoute(
        path: RouteUri.home,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const UserHomeScreen(),
        ),
      ),

      // GoRoute(
      //   path: RouteUri.adminIntro,
      //   pageBuilder: (context, state) => NoTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const AdminIntroScreen(),
      //   ),
      // ),
      // GoRoute(
      //   path: RouteUri.adminAbout,
      //   pageBuilder: (context, state) => NoTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const AdminAboutUsScreen(),
      //   ),
      // ),
      // GoRoute(
      //   path: RouteUri.adminExperience,
      //   pageBuilder: (context, state) => NoTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const AdminWorkExperienceScreen(),
      //   ),
      // ),
      // GoRoute(
      //   path: RouteUri.adminProjects,
      //   pageBuilder: (context, state) => NoTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const AdminProjectsScreen(),
      //   ),
      // ),
    ],
    redirect: (context, state) {
      if (unrestrictedRoutes.contains(state.matchedLocation)) {
        return null;
      } else if (publicRoutes.contains(state.matchedLocation)) {
        // Is public route.

        // User is logged in, redirect to home page.
        return RouteUri.home;
      }

      return null;
    },
  );
}

class RouteUri {
  static const String home = '/';
  static const String admin = '/admin';
  static const String adminIntro = '/intro';
  static const String adminAbout = '/about';
  static const String adminExperience = '/experience';
  static const String adminProjects = '/projects';
  static const String error404 = '/404';

  static const String intro = '/intro';
  static const String about = '/about';
  static const String experence = '/experience';
  static const String proejcts = '/projects';
}
