part of 'guards.dart';

///{@template guard_status_change}
/// The event that will be emitted when a guard status changes.
/// Now tracks a sorted list of guards and their status.
/// {@endtemplate}
class GuardsStatusChange {
  ///{@macro guard_status_change}
  GuardsStatusChange(Map<GuardBase, bool> guardsStatus)
      : guardsStatus = Map.unmodifiable(
          Map.fromEntries(
            guardsStatus.entries.toList()
              ..sort((a, b) =>
                  a.key.guardIdentifier.compareTo(b.key.guardIdentifier)),
          ),
        );

  /// Sorted, unmodifiable map of guards and their status.
  final Map<GuardBase, bool> guardsStatus;

  @override
  String toString() {
    return 'GuardsStatusChange{guardsStatus: $guardsStatus}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GuardsStatusChange &&
        _mapEquals(other.guardsStatus, guardsStatus);
  }

  @override
  int get hashCode => guardsStatus.hashCode;
}

/// Helper to compare two maps for equality.
bool _mapEquals<K, V>(Map<K, V> a, Map<K, V> b) {
  if (a.length != b.length) return false;
  for (final key in a.keys) {
    if (!b.containsKey(key) || b[key] != a[key]) return false;
  }
  return true;
}
