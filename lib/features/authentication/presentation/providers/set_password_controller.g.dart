// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_password_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SetPasswordController)
final setPasswordControllerProvider = SetPasswordControllerProvider._();

final class SetPasswordControllerProvider
    extends $NotifierProvider<SetPasswordController, void> {
  SetPasswordControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'setPasswordControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$setPasswordControllerHash();

  @$internal
  @override
  SetPasswordController create() => SetPasswordController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$setPasswordControllerHash() =>
    r'f10d25141770673fa73ec9cfec9cdfe1fac9bb7a';

abstract class _$SetPasswordController extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
