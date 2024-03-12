import 'package:edu_app/screens/inscription_screen/inscription_screen_two.dart';
import 'package:edu_app/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../screens/app_menu_screen/app_menu_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/infos_screen/infos_screen.dart';
import '../screens/inscription_screen/inscription_screen.dart';
import '../screens/loading_screen/loading_screen.dart';
import '../screens/notifications_screen/notifications_screen.dart';
import '../screens/simulateur_orientation_screen/simulateur_seconde_screen.dart';
import '../screens/simulateur_orientation_screen/simulateur_screen.dart';
import '../screens/soutien_screen/soutien_screen.dart';
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
        path: '/soutien-scolaire',
        builder: (BuildContext context, GoRouterState state) {
          return const SoutienScreen();
        }
      ),
      GoRoute(
          path: '/notifications',
          builder: (BuildContext context, GoRouterState state) {
            return const NotificationsScreen();
          }
      ),
      GoRoute(
        path: '/subject/:subjectId',
        builder: (BuildContext context, GoRouterState state) {
          return SubjectScreen(subjectTitle: state.pathParameters['subjectId'],);
        },
      ),
      GoRoute(
          path: '/simulateur-seconde',
          builder: (BuildContext context, GoRouterState state) {
            return const OrientationSecondeScreen();
          }
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
                path: 'accueil',
                pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    child: const HomeScreen()
                ),
              ),
              GoRoute(
                path: 'classes',
                pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    child: const ClassScreen()
                ),
              ),
              GoRoute(
                path: 'bibliotheque',
                pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    child: const Center(child: Text("Bibliothèque"))
                ),
              ),
             GoRoute(
                path: 'informations',
                builder: (BuildContext context, GoRouterState state) {
                  return const InfosScreen();
                },
              ),
              GoRoute(
                  path: 'simulateurs',
                  builder: (BuildContext context, GoRouterState state) {
                    return const SimulateurScreen();
                  },
              ),
              /*GoRoute(
                path: 'simulateurs',
                pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    child: const Center(child: Text("Simulateurs"))
                ),
              ),*/
            ],
          ),
        ]
      ),
      GoRoute(
        path: '/inscription',
        builder: (BuildContext context, GoRouterState state) {
          return const InscriptionScreen();
        },
        routes:  [
          GoRoute(
              path: 'step-2',
              builder: (BuildContext context, GoRouterState state) {
                return const InscriptionScreenTwo();
              }
          ),
        ]
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      const storage = FlutterSecureStorage();
      final String? loggedIn = await storage.read(key: "estConnecte");
      final String? expiration = await storage.read(key: "expiration");
      final DateTime dateNow = DateTime.now();
      final DateTime? dateExpiration = expiration != null ? DateTime.parse(expiration) : null;
      final path = state.fullPath;

      bool? isExpired ;
      if (dateExpiration != null ) {
        isExpired = dateNow.isAfter(dateExpiration);
      }

      if ( path !=null && path.contains("inscription") ) {
        return null;
      }

      if ( loggedIn != "true" || loggedIn == null || isExpired == true) {
        return '/login';
      }

      return null;
    },
  );
}