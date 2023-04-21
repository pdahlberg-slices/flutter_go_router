
import 'package:admin/domain/bloc/auth_bloc.dart';
import 'package:admin/domain/bloc/auth_events.dart';
import 'package:admin/domain/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = context.read();

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: const Center(
            child: Text('AuthPage'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              authBloc.add(AuthClicked());
            },
          ),
        );
      }
    );
  }

}

