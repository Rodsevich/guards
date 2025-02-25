import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guard_example/features/home/view/home_page.dart';
import 'package:guard_example/features/login/login.dart';
import 'package:guard_example/features/take_photo/view/take_photo_page.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static const String path = 'signin';

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
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        switch (state) {
          case LoginStateAuthenticated():
            await context.router.pushNamed(TakePhotoPage.path);
          case LoginStateUnauthenticated():
            await context.router.pushNamed(HomePage.path);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
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
                      if (state is LoginStateAuthenticated) {
                        context
                            .read<LoginBloc>()
                            .add(const LoginEventSignOut());
                      } else {
                        context.read<LoginBloc>().add(const LoginEventSignIn());
                      }
                    },
                    child: Text(
                      (state is LoginStateAuthenticated)
                          ? 'Sign out'
                          : 'Sign in',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
