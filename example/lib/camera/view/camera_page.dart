import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guard_example/camera/camera.dart';

@RoutePage()
class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CameraBloc(),
      child: const CameraView(),
    );
  }
}

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraBloc, CameraState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return Scaffold(
          backgroundColor: Colors.green,
          appBar: AppBar(
            title: const Text('Camera Permission '),
          ),
          body: const Column(
            children: [
              Text('Ask for permission to use camera'),
            ],
          ),
        );
      },
    );
  }
}
