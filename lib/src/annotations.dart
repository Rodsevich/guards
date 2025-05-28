import 'package:app_guards/guards.dart';

/// guard your pages with this
class Guarded {
  /// guard your pages with this
  const Guarded(this.guards);

  /// All the guards with which you guard your pages
  final List<GuardBase> guards;
}
