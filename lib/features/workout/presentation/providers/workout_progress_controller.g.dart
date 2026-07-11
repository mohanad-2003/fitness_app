// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_progress_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WorkoutProgressTab)
final workoutProgressTabProvider = WorkoutProgressTabProvider._();

final class WorkoutProgressTabProvider
    extends $NotifierProvider<WorkoutProgressTab, ProgressTab> {
  WorkoutProgressTabProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workoutProgressTabProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workoutProgressTabHash();

  @$internal
  @override
  WorkoutProgressTab create() => WorkoutProgressTab();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProgressTab value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProgressTab>(value),
    );
  }
}

String _$workoutProgressTabHash() =>
    r'e61ee787ff889abf79fa2c2937f7992569681d4a';

abstract class _$WorkoutProgressTab extends $Notifier<ProgressTab> {
  ProgressTab build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ProgressTab, ProgressTab>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProgressTab, ProgressTab>,
              ProgressTab,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(activityLog)
final activityLogProvider = ActivityLogProvider._();

final class ActivityLogProvider
    extends
        $FunctionalProvider<
          List<ActivityLogItem>,
          List<ActivityLogItem>,
          List<ActivityLogItem>
        >
    with $Provider<List<ActivityLogItem>> {
  ActivityLogProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activityLogProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activityLogHash();

  @$internal
  @override
  $ProviderElement<List<ActivityLogItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ActivityLogItem> create(Ref ref) {
    return activityLog(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ActivityLogItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ActivityLogItem>>(value),
    );
  }
}

String _$activityLogHash() => r'd0b5841125e89a03db79d10ce9a0a85032bb8277';
