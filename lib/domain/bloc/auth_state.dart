
import 'package:admin/domain/bloc/result_base_state.dart';
import 'package:flutter/cupertino.dart';

class AuthState extends ResultBaseState {

  const AuthState({
    required this.authenticated,
    String? errorMsg,
  }) : super(errorMsg);

  AuthState.waiting() : this(authenticated: false);
  AuthState.error(String msg) : this(authenticated: false, errorMsg: msg);

  final bool authenticated;

  AuthState copyWith({
    bool? authenticated,
    ValueGetter<String?>? errorMsg,
  }) {
    return AuthState(
      authenticated: authenticated ?? this.authenticated,
      errorMsg: errorMsg != null ? errorMsg() : super.errorMsg,
    );
  }

  @override
  List<Object?> get props => [authenticated, isOk];

}

