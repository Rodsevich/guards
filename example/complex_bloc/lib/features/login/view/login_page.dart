import 'package:app_guards/auto_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guard_example/app/router/router.gr.dart';
import 'package:guard_example/features/login/login.dart';

@RoutePage()
class LoginPage extends AutoRouteGuardSatisfyingPage {
  const LoginPage({required super.guardCallback, super.key});

  static const String path = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(loginGuardCallback: guardCallback),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return const AutoTabsScaffold(
          backgroundColor: Colors.yellow,
          routes: [SignInRoute(), SignoutRoute()],
        );
      },
    );
  }
}
