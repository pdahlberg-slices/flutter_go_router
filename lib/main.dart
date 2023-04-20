import 'package:admin/infra/app_router.dart';
import 'package:admin/infra/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ProductionEnvironment());
}

/*final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const ItemListPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const ItemDetailsPage(id: 1);
          },
        ),
      ],
    ),
  ],
);*/

class ProductionEnvironment extends StatelessWidget {

  const ProductionEnvironment({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        ...Dependencies.common(),
        ...Dependencies.prod(),
      ],
      child: MultiBlocProvider(
        providers: [
          ...Dependencies.blocs(),
        ],
        child: App(),
      ),
    );
  }

}

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter goRouter = Provider.of<AppRouter>(context, listen: false).router;

    return MaterialApp.router(
      routerConfig: goRouter,
    );
  }
}
