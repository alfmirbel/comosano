import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';
import 'target_points_notifier.dart';
import '../../../core_backend_services/10_user_login/usuario_login/provider_session.dart';
import '../repositories/diet_tracking_repository.dart';

part 'daily_log_notifier.g.dart';

@Riverpod(keepAlive: true)
class DailyLogNotifier extends _$DailyLogNotifier {
  @override
  DailyLog build(DateTime date) {
    final sessionState = ref.read(sessionProvider);
    final userId = sessionState.sessionUserData.userId;
    _fetchDailyLog(date, userId);
    
    final target = ref.read(targetPointsProvider);
    final id =
        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

    // Escuchar cambios en las metas para recalcular el porcentaje de inmediato
    ref.listen(targetPointsProvider, (previous, next) {
      if (previous != next) {
        state = state.copyWith(targetPoints: next);
        _saveState(userId);
      }
    });

    return DailyLog(
      id: id,
      date: date,
      targetPoints: target,
      consumedFoods: const [],
    );
  }

  Future<void> _fetchDailyLog(DateTime date, String userId) async {
    final repo = ref.read(dietTrackingRepositoryProvider);
    final log = await repo.fetchDailyLog(date, userId);
    if (log != null) {
      // Inyectar siempre las metas actuales, ya que las guardadas podrían ser viejas o nulas.
      final latestTargets = ref.read(targetPointsProvider);
      state = log.copyWith(targetPoints: latestTargets);
    }
  }

  void addFoodEntry(FoodCatalogItem catalogItem) {
    final entry = FoodEntry(
      id: const Uuid().v4(),
      name: catalogItem.name,
      category: catalogItem.category,
      colorPoints: catalogItem.colorPoints,
      isFree: catalogItem.isFree,
      timestamp: DateTime.now(),
    );

    final updatedFoods = List<FoodEntry>.from(state.consumedFoods)..add(entry);
    state = state.copyWith(consumedFoods: updatedFoods);
    _saveState(ref.read(sessionProvider).sessionUserData.userId);
  }

  void removeFoodEntry(String id) {
    state = state.copyWith(
      consumedFoods: state.consumedFoods.where((e) => e.id != id).toList(),
    );
    _saveState(ref.read(sessionProvider).sessionUserData.userId);
  }

  Future<void> _saveState(String userId) async {
    final repo = ref.read(dietTrackingRepositoryProvider);
    await repo.saveDailyLog(state, userId);
  }
}
