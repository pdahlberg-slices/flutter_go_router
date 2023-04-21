import 'package:admin/domain/service/auth_service.dart';
import 'package:admin/domain/view/auth_page.dart';
import 'package:admin/domain/view/item_details_page.dart';
import 'package:admin/domain/view/item_list_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {

  final AuthService authService;
  GoRouter get router => _goRouter;

  AppRouter(this.authService);

  AppRouter.of(BuildContext context) : this(
    context.read(),
  );

  late final GoRouter _goRouter = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const ItemListPage();
        },
        redirect: (BuildContext context, GoRouterState state) {
          if(authService.isLoggedIn()) {
            return null;
          } else {
            return '/login';
          }
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return const AuthPage();
            },
          ),
          GoRoute(
            path: 'details',
            name: 'details',
            builder: (BuildContext context, GoRouterState state) {
              return const ItemDetailsPage(id: 1);
            },
          ),
        ],
      ),
    ],
    //errorBuilder: (context, state) => ErrorPage(error: state.error.toString())
  );
}
