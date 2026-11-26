import 'deal.dart';

/// Counts shown on the profile.
class CollabStats {
  const CollabStats({
    required this.completed,
    required this.active,
    required this.applied,
  });

  factory CollabStats.of(Iterable<Deal> deals) {
    var completed = 0, active = 0, applied = 0;
    for (final d in deals) {
      switch (d.bucket) {
        case CollabBucket.done:
          completed++;
        case CollabBucket.ongoing:
          active++;
        case CollabBucket.applied:
          applied++;
        case CollabBucket.closed:
          break;
      }
    }
    return CollabStats(completed: completed, active: active, applied: applied);
  }

  final int completed;
  final int active;
  final int applied;
}
