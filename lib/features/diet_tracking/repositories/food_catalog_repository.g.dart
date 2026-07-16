// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_catalog_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(foodCatalogRepository)
final foodCatalogRepositoryProvider = FoodCatalogRepositoryProvider._();

final class FoodCatalogRepositoryProvider extends $FunctionalProvider<
    FoodCatalogRepository,
    FoodCatalogRepository,
    FoodCatalogRepository> with $Provider<FoodCatalogRepository> {
  FoodCatalogRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'foodCatalogRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$foodCatalogRepositoryHash();

  @$internal
  @override
  $ProviderElement<FoodCatalogRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FoodCatalogRepository create(Ref ref) {
    return foodCatalogRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FoodCatalogRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FoodCatalogRepository>(value),
    );
  }
}

String _$foodCatalogRepositoryHash() =>
    r'5cf7e54d96a31f1e398ac4ac5b8e38ad75fa2eb5';
