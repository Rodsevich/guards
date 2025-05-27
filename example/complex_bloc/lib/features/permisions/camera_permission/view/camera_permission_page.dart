import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guard_example/features/permisions/camera_permission/camera_permission.dart';
import 'package:guards/auto_route.dart';

@RoutePage()
class CameraPermissionPage extends AutoRouteGuardSatisfyingPage {
  const CameraPermissionPage({super.key, required super.guardCallback});

  static const String path = '/permissions/camera';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CameraPermissionBloc(),
      child: const CameraPermissionView(),
    );
  }
}

class CameraPermissionView extends StatelessWidget {
  const CameraPermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera Permission')),
      body: BlocListener<CameraPermissionBloc, CameraPermissionState>(
        listener: (context, state) async {
          switch (state) {
            case CameraPermissionStateGranted() ||
                CameraPermissionStateRevoked():
              await context.router.maybePop();
          }
        },
        child: BlocBuilder<CameraPermissionBloc, CameraPermissionState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ask for permission to use camera',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CameraPermissionBloc>().add(
                          CameraPermissionEventGrantPermission(),
                        );
                      },
                      child: const Text('Grant Permission'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CameraPermissionBloc>().add(
                          CameraPermissionEventRevokePermission(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Revoke Permission'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
