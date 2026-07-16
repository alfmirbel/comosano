// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_tracking_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dietTrackingRepository)
final dietTrackingRepositoryProvider = DietTrackingRepositoryProvider._();

final class DietTrackingRepositoryProvider extends $FunctionalProvider<
    DietTrackingRepository,
    DietTrackingRepository,
    DietTrackingRepository> with $Provider<DietTrackingRepository> {
  DietTrackingRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dietTrackingRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dietTrackingRepositoryHash();

  @$internal
  @override
  $ProviderElement<DietTrackingRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DietTrackingRepository create(Ref ref) {
    return dietTrackingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DietTrackingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DietTrackingRepository>(value),
    );
  }
}

String _$dietTrackingRepositoryHash() =>
    r'a6c80a49b49af37a1d65f32e49aea6ec51985da6';
