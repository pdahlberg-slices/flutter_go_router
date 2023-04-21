
import 'package:admin/domain/bloc/auth_events.dart';
import 'package:admin/domain/bloc/auth_state.dart';
import 'package:admin/domain/service/auth_service.dart';
import 'package:admin/infra/app_router.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final AuthService _authService;
  final AppRouter _appRouter;

  AuthBloc(
    this._authService,
    this._appRouter,
  ) : super(AuthState.waiting()) {
    on<AuthClicked>(_onAuthClicked);
  }

  AuthBloc.of(BuildContext context) : this(
    context.read(),
    context.read(),
  );
  
  Future<void> _onAuthClicked(AuthClicked event, Emitter<AuthState> emit) async {
    await _authService.login();

    emit(state.copyWith(
      authenticated: _authService.isLoggedIn(),
    ));
    _appRouter.router.go('/');
  }

}
