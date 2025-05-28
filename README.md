# Guards
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

## Setup 🚧

1️⃣ `flutter pub add guards`  
2️⃣ Create `lib/core/guards/base.dart` with your project settings

```dart
abstract base class MyProjectGuard extends GuardBase {
    //none of the project guards will require a special persistenceDelegate, so we cut down that possibility project-wide with this code
    MyProjectGuard() : super(persistenceDelegate: null);
}
```

3️⃣ Create your guards like `lib/core/guards/login_guard.dart`

```dart
class GuardLogin extends MyProjectGuard{
    ///Implement every field
}

```

4️⃣ Define your project's guards in a GuardsSystem of your project:

```dart
class MyProjectGuards extends Guards {
  MyProjectGuards({required this.gpsActive})
    : super(persistenceDelegate: null, initialGuards: [gpsActive]);

  // define the guards you want to use in your app like this as much as possible for simplicity and ease of use
  final GuardGpsActive gpsActive;

  // if for some reason you want to have a guard that can't be initialized at the start of the app, you can use this technique instead
  GuardGeolocationPermission get geolocationPermission =>
      getGuardByGuardIdentifier('geolocation_permission');
}
```

5️⃣ Create the pages that will be used for redirection when guards aren't satisfied

🔀 This package tries to be agnostic in the routing solution of your choice, but here are the vicissitudes for every solution you could have

### auto_route

6️⃣ Add your guard system to your MaterialApp router

### go_router

TBD

### vanilla

TBD

###

---

## Running Tests 🧪

For first time users, install the [very_good_cli][very_good_cli_link]:

```sh
dart pub global activate very_good_cli
```

To run all unit tests:

```sh
very_good test --coverage
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
open coverage/index.html
```

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows


### Usage
 1. Import the package
 2. Define the guards you will use in a `guards/` dir on your app's dir
 3. Include a `Guards.init()` in your bootstrap with the PersistenceDelegate in charge of storing in the app memory-on-disk the guards status
 4. Include the guards in your router


## Features
 - [ ] checkeo de estado de las guardas
 - [ ] asd
