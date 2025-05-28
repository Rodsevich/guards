/// {@template non_existent_guard}
/// Throw this error when the guard requested was not defined before.
/// {@endtemplate}
class NonExistentGuard extends StateError {
  ///{@macro non_existent_guard}
  NonExistentGuard(String id)
      : super('The guard identified with "$id" was not '
            'defined before. Please ensure you define it in Guards.init call '
            'or afterwards through Guards.addGuard().');
}
