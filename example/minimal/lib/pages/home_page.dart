import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.lightGreen[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'If you are seeing this page, it means that '
            'the guards are working correctly.',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          // The counter value is displayed here.
          ElevatedButton(
            onPressed: () {
              context.router.reevaluateGuards();
            },
            child: Text('Recheck'),
          ),
        ],
      ),
    );
  }
}
