import 'package:admin/domain/service/time_service.dart';
import 'package:admin/domain/view/item_details_page.dart';
import 'package:admin/domain/view/item_list_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {

  final TimeService timeService;
  GoRouter get router => _goRouter;

  AppRouter(this.timeService);

  AppRouter.of(BuildContext context) : this(
    context.read(),
  );

  late final GoRouter _goRouter = GoRouter(
    //refreshListenable: appService,
    //initialLocation: APP_PAGE.home.toPath,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const ItemListPage();
        },
        routes: <RouteBase>[
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
    /*errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),
    redirect: (state) {
      final loginLocation = state.namedLocation(APP_PAGE.login.toPath);
      final homeLocation = state.namedLocation(APP_PAGE.home.toPath);
      final splashLocation = state.namedLocation(APP_PAGE.splash.toPath);
      final onboardLocation = state.namedLocation(APP_PAGE.onBoarding.toPath);

      final isLogedIn = appService.loginState;
      final isInitialized = appService.initialized;
      final isOnboarded = appService.onboarding;

      final isGoingToLogin = state.subloc == loginLocation;
      final isGoingToInit = state.subloc == splashLocation;
      final isGoingToOnboard = state.subloc == onboardLocation;

      // If not Initialized and not going to Initialized redirect to Splash
      if (!isInitialized && !isGoingToInit) {
        return splashLocation;
        // If not onboard and not going to onboard redirect to OnBoarding
      } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
        return onboardLocation;
        // If not logedin and not going to login redirect to Login
      } else if (isInitialized && isOnboarded && !isLogedIn && !isGoingToLogin) {
        return loginLocation;
        // If all the scenarios are cleared but still going to any of that screen redirect to Home
      } else if ((isLogedIn && isGoingToLogin) || (isInitialized && isGoingToInit) || (isOnboarded && isGoingToOnboard)) {
        return homeLocation;
      } else {
        // Else Don't do anything
        return null;
      }
    },*/
  );
}
