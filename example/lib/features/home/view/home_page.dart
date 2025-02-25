import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guard_example/app/router/router.gr.dart';
import 'package:guard_example/features/home/home.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String path = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: Colors.blue,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Home'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Home state: ${state.runtimeType}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.router.push(const TakePhotoRoute());
                    },
                    child: const Text('Take Photo'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
