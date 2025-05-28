import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:geolocator/geolocator.dart';
import 'package:minimal/main.dart';

@RoutePage()
class PageGeolocationPermissionGuard extends StatelessWidget {
  const PageGeolocationPermissionGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: const Text('Geolocation Permission Page'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'As you are seeing this page, the Geolocation permission guard was not satisfied.',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            'Concede geolocation permission to continue using the app.',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            onPressed: () {
              Geolocator.requestPermission().then((permission) {
                if (permission == LocationPermission.always ||
                    permission == LocationPermission.whileInUse) {
                  // by just informing the guard that the permission is satisfied,
                  // the redirection should be handled autmatically
                  minimalExampleGuards.geolocationPermission.update(
                    isSatisfied: true,
                  );
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Permission denied')));
                }
              });
            },
            child: Text('Concede permission'),
          ),
          ElevatedButton(
            onPressed: () {
              Geolocator.openAppSettings().then((value) {
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
