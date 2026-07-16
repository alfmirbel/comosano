// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_log_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DailyLogNotifier)
final dailyLogProvider = DailyLogNotifierFamily._();

final class DailyLogNotifierProvider
    extends $NotifierProvider<DailyLogNotifier, DailyLog> {
  DailyLogNotifierProvider._(
      {required DailyLogNotifierFamily super.from,
      required DateTime super.argument})
      : super(
          retry: null,
          name: r'dailyLogProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dailyLogNotifierHash();

  @override
  String toString() {
    return r'dailyLogProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DailyLogNotifier create() => DailyLogNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DailyLog value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DailyLog>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DailyLogNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dailyLogNotifierHash() => r'63222ba20430f69f012d7245145a51f1441593d8';

final class DailyLogNotifierFamily extends $Family
    with
        $ClassFamilyOverride<DailyLogNotifier, DailyLog, DailyLog, DailyLog,
            DateTime> {
  DailyLogNotifierFamily._()
      : super(
          retry: null,
          name: r'dailyLogProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  DailyLogNotifierProvider call(
    DateTime date,
  ) =>
      DailyLogNotifierProvider._(argument: date, from: this);

  @override
  String toString() => r'dailyLogProvider';
}

abstract class _$DailyLogNotifier extends $Notifier<DailyLog> {
  late final _$args = ref.$arg as DateTime;
  DateTime get date => _$args;

  DailyLog build(
    DateTime date,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DailyLog, DailyLog>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DailyLog, DailyLog>, DailyLog, Object?, Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}
