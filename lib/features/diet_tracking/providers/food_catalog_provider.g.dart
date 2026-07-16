// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_catalog_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(foodCatalog)
final foodCatalogProvider = FoodCatalogFamily._();

final class FoodCatalogProvider extends $FunctionalProvider<
        AsyncValue<List<FoodCatalogItem>>,
        List<FoodCatalogItem>,
        FutureOr<List<FoodCatalogItem>>>
    with
        $FutureModifier<List<FoodCatalogItem>>,
        $FutureProvider<List<FoodCatalogItem>> {
  FoodCatalogProvider._(
      {required FoodCatalogFamily super.from, required String? super.argument})
      : super(
          retry: null,
          name: r'foodCatalogProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$foodCatalogHash();

  @override
  String toString() {
    return r'foodCatalogProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<FoodCatalogItem>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<FoodCatalogItem>> create(Ref ref) {
    final argument = this.argument as String?;
    return foodCatalog(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FoodCatalogProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$foodCatalogHash() => r'c01e69a35ae74da604bd86ff0b198a5d67536f21';

final class FoodCatalogFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<FoodCatalogItem>>, String?> {
  FoodCatalogFamily._()
      : super(
          retry: null,
          name: r'foodCatalogProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  FoodCatalogProvider call(
    String? userId,
  ) =>
      FoodCatalogProvider._(argument: userId, from: this);

  @override
  String toString() => r'foodCatalogProvider';
}
