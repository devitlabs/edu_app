import 'package:edu_app/screens/inscription_screen/inscription_screen_three.dart';
import 'package:edu_app/screens/inscription_screen/inscription_screen_two.dart';
import 'package:edu_app/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/app_menu_screen/app_menu_screen.dart';
import '../screens/inscription_screen/inscription_screen.dart';
import '../screens/loading_screen/loading_screen.dart';
import '../screens/option_screen/option_screen.dart';
import '../screens/ressources_screen/ressource_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/class_screen/class_screen.dart';
import '../screens/subject_screen/subject_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class RouteClass {
  static final GoRouter router = GoRouter(
    initialLocation: "/",
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/option',
        builder: (BuildContext context, GoRouterState state) {
          return const OptionScreen();
        },
      ),
      GoRoute(
        path: '/ressources',
        builder: (BuildContext context, GoRouterState state) {
          return const RessourceScreen();
        },
      ),
      GoRoute(
        path: '/subject/:subjectId',
        builder: (BuildContext context, GoRouterState state) {
          return SubjectScreen(subjectTitle: state.pathParameters['subjectId'],);
        },
      ),
      GoRoute(
        path: '/app-menu',
        builder: (BuildContext context, GoRouterState state) {
          return const LoadingScreen();
        },
        routes: [
          ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return AppMenuScreen(child: child);
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'classe',
                pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    child: const ClassScreen()
                ),
              ),
              GoRoute(
                path: 'resultats',
                pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    child: Center(child: const Text("Résultats"))
                ),
              ),
              GoRoute(
                path: 'soutien',
                pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    child: Center(child: const Text("Soutien"))
                ),
              ),
            ],
          ),
        ]
      ),
      GoRoute(
        path: '/inscription',
        builder: (BuildContext context, GoRouterState state) {
          return InscriptionScreen();
        },
        routes:  [
          GoRoute(
              path: 'step-2',
              builder: (BuildContext context, GoRouterState state) {
                return InscriptionScreenTwo();
              }
          ),
          GoRoute(
              path: 'step-3',
              builder: (BuildContext context, GoRouterState state) {
                return InscriptionScreenThree();
              }
          ),
        ]
      ),
    ],
  );
}