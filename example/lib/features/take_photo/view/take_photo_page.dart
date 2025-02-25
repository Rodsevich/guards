import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guard_example/features/home/view/home_page.dart';

import 'package:guard_example/features/take_photo/bloc/take_photo_bloc.dart';

@RoutePage()
class TakePhotoPage extends StatelessWidget {
  const TakePhotoPage({super.key});

  static const String path = '/take_photo';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TakePhotoBloc(),
      child: const TakePhotoView(),
    );
  }
}

class TakePhotoView extends StatelessWidget {
  const TakePhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocListener<TakePhotoBloc, TakePhotoState>(
        listener: (context, state) async{
          switch (state) { 
            case TakePhotoStateGoHomeButtonTapped():
              await context.router.pushNamed(HomePage.path);
          }
        },
        child: BlocBuilder<TakePhotoBloc, TakePhotoState>(
          builder: (context, state) {
            return PopScope(
              canPop: false,
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: const Text('Take a photo'),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Now you can take a photo!',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<TakePhotoBloc>()
                              .add(TakePhotoEventGoHome());
                        },
                        child: const Text('Go to Home'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
