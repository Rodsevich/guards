import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guard_example/app/router/router.dart';
import 'package:guard_example/bootstrap.dart';
import 'package:guard_example/features/login/login.dart';
import 'package:guard_example/features/permissions/camera_permission/camera_permission.dart';
import 'package:guard_example/l10n/arb/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(exampleGuards);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => CameraPermissionBloc()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: appRouter.config(
          // reevaluateListenable: null,
          // ReevaluateListenable.stream(
          //   exampleGuards.guardListenableStream,
          // ),
        ),
      ),
    );
  }
}
