import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
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
        blocGrantPermission() {
          BlocProvider.of<CameraBloc>(context)
              .add(CameraEventGrantPermission());
        }

        blocRevokePermission() {
          BlocProvider.of<CameraBloc>(context)
              .add(CameraEventRevokePermission());
        }

        return Scaffold(
          backgroundColor: Colors.green,
          appBar: AppBar(
            title: const Text('Camera Permission'),
          ),
          body: Column(
            children: [
              const Text('Ask for permission to use camera'),
              ElevatedButton(
                onPressed: blocGrantPermission,
                child: const Text('grant permission'),
              ),
              ElevatedButton(
                onPressed: blocRevokePermission,
                child: const Text('revoke permission'),
              ),
            ],
          ),
        );
      },
    );
  }
}
