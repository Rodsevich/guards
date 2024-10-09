import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guard_example/restricted/restricted.dart';

// @Guarded([guards.login, guards.camera])
@RoutePage()
class RestrictedPage extends StatelessWidget {
  const RestrictedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RestrictedBloc(),
      child: const RestrictedView(),
    );
  }
}

class RestrictedView extends StatelessWidget {
  const RestrictedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestrictedBloc, RestrictedState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.green,
          appBar: AppBar(
            title: const Text('Restricted content'),
          ),
          body: const Center(
            child:
                Text('Congratulations! 🎉 You now can see restricted content'),
          ),
        );
      },
    );
  }
}
