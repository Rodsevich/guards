import 'package:auto_route/annotations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guard_example/features/login/signout/signout.dart';

@RoutePage()
class SignoutPage extends StatelessWidget {
  const SignoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignoutBloc(),
      child: const SignoutView(),
    );
  }
}

class SignoutView extends StatelessWidget {
  const SignoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignoutBloc, SignoutState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return const SizedBox();
      },
    );
  }
}
