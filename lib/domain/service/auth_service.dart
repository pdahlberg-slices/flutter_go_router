
import 'package:admin/domain/service/time_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthService {

  final TimeService timeService;

  AuthService(this.timeService);

  AuthService.of(BuildContext context) : this(
    context.read(),
  );

  bool isLoggedIn() {
    return false;
  }

}