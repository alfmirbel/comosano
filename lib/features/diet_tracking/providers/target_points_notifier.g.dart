// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_points_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TargetPointsNotifier)
final targetPointsProvider = TargetPointsNotifierProvider._();

final class TargetPointsNotifierProvider
    extends $NotifierProvider<TargetPointsNotifier, TargetPoints> {
  TargetPointsNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'targetPointsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$targetPointsNotifierHash();

  @$internal
  @override
  TargetPointsNotifier create() => TargetPointsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TargetPoints value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TargetPoints>(value),
    );
  }
}

String _$targetPointsNotifierHash() =>
    r'3e772d0331b8b925e2918bee9e60115f56960d7e';

abstract class _$TargetPointsNotifier extends $Notifier<TargetPoints> {
  TargetPoints build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TargetPoints, TargetPoints>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<TargetPoints, TargetPoints>,
        TargetPoints,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
