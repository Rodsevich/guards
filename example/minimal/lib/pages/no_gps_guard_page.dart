import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:geolocator/geolocator.dart';

@RoutePage()
class PageGpsNotActiveGuard extends StatelessWidget {
  const PageGpsNotActiveGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: const Text('No GPS Guard Page'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'As you are seeing this page, the GPS guard was not satisfied.',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            'Activate your GPS to continue using the app.',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            onPressed: () {
              context.router.reevaluateGuards();
            },
            child: Text(
              'Check again '
              '(this could be a timer that periodically'
              ' rechecks por improved UX)',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Geolocator.openLocationSettings().then((value) {
                context.router.reevaluateGuards();
              });
            },
            child: Text('Open location settings'),
          ),
        ],
      ),
    );
  }
}
