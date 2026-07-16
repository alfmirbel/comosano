import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/models.dart';
import '../repositories/diet_tracking_repository.dart';
import '../../../core_backend_services/10_user_login/usuario_login/provider_session.dart';

part 'target_points_notifier.g.dart';

@Riverpod(keepAlive: true)
class TargetPointsNotifier extends _$TargetPointsNotifier {
  @override
  TargetPoints build() {
    _fetchInitialTargets();
    return const TargetPoints();
  }

  Future<void> _fetchInitialTargets() async {
    final sessionState = ref.read(sessionProvider);
    final userId = sessionState.sessionUserData.userId;

    final repo = ref.read(dietTrackingRepositoryProvider);
    final targets = await repo.fetchTargetPoints(userId);
    if (targets != null) {
      state = targets;
    }
  }

  void setSlotsForCategory(String category, int slots) {
    final updatedSlots = Map<String, int>.from(state.slotsPerCategory);
    updatedSlots[category] = slots;
    state = state.copyWith(slotsPerCategory: updatedSlots);

    final sessionState = ref.read(sessionProvider);
    final userId = sessionState.sessionUserData.userId;
    final repo = ref.read(dietTrackingRepositoryProvider);
    repo.saveTargetPoints(state, userId); // async but don't await so UI doesn't block
  }

  void loadTargetPoints(TargetPoints targetPoints) {
    state = targetPoints;
  }
}
