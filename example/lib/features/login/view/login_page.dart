import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guard_example/app/router/router.gr.dart';

import 'package:guard_example/features/login/login.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String path = '/login';

  @override
  Widget build(BuildContext context) {
    return const LoginView();
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
          routes: [
            SignInRoute(),
            SignoutRoute(),
          ],
        );
      },
    );
  }
}
