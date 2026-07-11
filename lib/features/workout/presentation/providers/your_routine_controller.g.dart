// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'your_routine_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(YourRoutineController)
final yourRoutineControllerProvider = YourRoutineControllerProvider._();

final class YourRoutineControllerProvider
    extends $NotifierProvider<YourRoutineController, List<RoutineItem>> {
  YourRoutineControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'yourRoutineControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$yourRoutineControllerHash();

  @$internal
  @override
  YourRoutineController create() => YourRoutineController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RoutineItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RoutineItem>>(value),
    );
  }
}

String _$yourRoutineControllerHash() =>
    r'e219dfb1ae94b3eb61985e7dd78d6459aeed0f63';

abstract class _$YourRoutineController extends $Notifier<List<RoutineItem>> {
  List<RoutineItem> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<RoutineItem>, List<RoutineItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<RoutineItem>, List<RoutineItem>>,
              List<RoutineItem>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
