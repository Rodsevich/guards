// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:guards/guards.dart';
import 'package:guards/src/core/guards.dart';
import 'package:mocktail/mocktail.dart';

class TestGuards extends Guards {
  TestGuards() : super(persistenceDelegate: null, initialGuards: []);
}

class MockCameraGuard extends Mock implements CameraGuard {}

void main() {
  // bootstrap() {
  //   GuardSystem.init();
  // }

  group("Guard's Stream", () {
    // test("the stream doesn't output reports dups", () async {
    //   StreamController<GuardStatusChange> streamController =
    //       StreamController<GuardStatusChange>();
    //   final guards = TestGuards();
    //   // Create a mock of CameraGuard using mocktail

    //   final mockedCameraGuard = MockCameraGuard();
    //   when(() => mockedCameraGuard.guardIdentifier).thenReturn('camera');
    //   when(() => mockedCameraGuard.checkIfSatisfied).thenReturn(true);
    //   when(() => mockedCameraGuard.setUpAndInitializeGuard())
    //       .thenAnswer((_) async => true);
    //   guards.addGuard(mockedCameraGuard);
    //   final stream = guards.guardListenableStream;
    //   int eventCount = 0;
    //   final subscription = stream.listen((event) {
    //     eventCount++;
    //   });

    //   expect(eventCount, 2,
    //       reason:
    //           'Stream should emit only on status change, not on duplicates');

    //   await subscription.cancel();
    // });
  });
}
