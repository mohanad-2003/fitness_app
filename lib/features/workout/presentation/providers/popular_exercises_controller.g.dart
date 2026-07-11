// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_exercises_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(popularExercises)
final popularExercisesProvider = PopularExercisesProvider._();

final class PopularExercisesProvider
    extends
        $FunctionalProvider<
          List<PopularExerciseItem>,
          List<PopularExerciseItem>,
          List<PopularExerciseItem>
        >
    with $Provider<List<PopularExerciseItem>> {
  PopularExercisesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'popularExercisesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$popularExercisesHash();

  @$internal
  @override
  $ProviderElement<List<PopularExerciseItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<PopularExerciseItem> create(Ref ref) {
    return popularExercises(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PopularExerciseItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PopularExerciseItem>>(value),
    );
  }
}

String _$popularExercisesHash() => r'6fcdee13e964794a1e5bd450c68e2cdc809a91de';
