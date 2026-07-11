// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_routine_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreateRoutineController)
final createRoutineControllerProvider = CreateRoutineControllerProvider._();

final class CreateRoutineControllerProvider
    extends $NotifierProvider<CreateRoutineController, List<RoutineExercise>> {
  CreateRoutineControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createRoutineControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createRoutineControllerHash();

  @$internal
  @override
  CreateRoutineController create() => CreateRoutineController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RoutineExercise> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RoutineExercise>>(value),
    );
  }
}

String _$createRoutineControllerHash() =>
    r'2e9411658736f6d374674f36a3d32eb7f13664eb';

abstract class _$CreateRoutineController
    extends $Notifier<List<RoutineExercise>> {
  List<RoutineExercise> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<RoutineExercise>, List<RoutineExercise>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<RoutineExercise>, List<RoutineExercise>>,
              List<RoutineExercise>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
