import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:minimal/app/router/router.dart';
import 'package:minimal/main.dart';

class GuardsMinimalExampleApp extends StatelessWidget {
  const GuardsMinimalExampleApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(minimalExampleGuards);

    return MaterialApp.router(
      title: 'Sorpo',
      routerConfig: appRouter.config(
        reevaluateListenable: ReevaluateListenable.stream(
          minimalExampleGuards.guardListenableStream,
        ),
      ),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
      ),
    );
  }
}
