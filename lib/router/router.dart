import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/screens.dart';
import '../models/models.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(
            child: HomeScreen(),
          );
        },
      ),
      GoRoute(
          path: '/settings',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(
              child: Text('Settings Screen'),
            );
          }),
      GoRoute(
        path: '/auth',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(
            child: AuthPage(),
          );
        },
      ),
    ],
    redirect: (context, state) {
      if (!AuthService.isLoggedIn()) {
        return '/auth';
      }
      return '/';
    },
  );
}
