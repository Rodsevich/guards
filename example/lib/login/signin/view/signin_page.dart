import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guard_example/login/login.dart';
import 'package:guards/auto_route.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: const SignInView(),
    );
  }
}

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.orange,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login state: ${state.runtimeType}'),
                ElevatedButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(const LoginEventSignIn());
                  },
                  child: const Text('Sign in'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
