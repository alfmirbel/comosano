import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core_backend_services/10_user_login/usuario_login/provider_session.dart';
import '../../../../core_backend_services/60_global_widgets/debugprint.dart';
import '../models/models.dart';
import '../repositories/food_catalog_repository.dart';

part 'food_catalog_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<FoodCatalogItem>> foodCatalog(Ref ref, String? userId) async {
  try {
    final repo = ref.watch(foodCatalogRepositoryProvider);
    final catalog = await repo.getCatalog(userId: userId);
    return catalog;
  } catch (e) {
    debugPrintLevels(1, 'foodCatalog provider failed: $e');
    final repo = ref.watch(foodCatalogRepositoryProvider);
    return repo.getCatalog(userId: userId);
  }
}
