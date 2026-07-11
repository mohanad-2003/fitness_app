// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteFilterController)
final favoriteFilterControllerProvider = FavoriteFilterControllerProvider._();

final class FavoriteFilterControllerProvider
    extends $NotifierProvider<FavoriteFilterController, FavoriteFilter> {
  FavoriteFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteFilterControllerHash();

  @$internal
  @override
  FavoriteFilterController create() => FavoriteFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FavoriteFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FavoriteFilter>(value),
    );
  }
}

String _$favoriteFilterControllerHash() =>
    r'bb3220cb3df768a7b74a534b1dfe513294befa15';

abstract class _$FavoriteFilterController extends $Notifier<FavoriteFilter> {
  FavoriteFilter build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<FavoriteFilter, FavoriteFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FavoriteFilter, FavoriteFilter>,
              FavoriteFilter,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredFavorites)
final filteredFavoritesProvider = FilteredFavoritesProvider._();

final class FilteredFavoritesProvider
    extends
        $FunctionalProvider<
          List<FavoriteItem>,
          List<FavoriteItem>,
          List<FavoriteItem>
        >
    with $Provider<List<FavoriteItem>> {
  FilteredFavoritesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredFavoritesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredFavoritesHash();

  @$internal
  @override
  $ProviderElement<List<FavoriteItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<FavoriteItem> create(Ref ref) {
    return filteredFavorites(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<FavoriteItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<FavoriteItem>>(value),
    );
  }
}

String _$filteredFavoritesHash() => r'93055f0832692fd1a00d4ce94c4a01f3a13469d9';
