// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Mock data provider — a straight Provider (not a Notifier) since nothing
/// on the home dashboard is mutated, matching the legacy `Homecontroller`
/// which never called `.obs`. Swap the body for a repository call once a
/// backend exists; the page never needs to change.

@ProviderFor(homeCategories)
final homeCategoriesProvider = HomeCategoriesProvider._();

/// Mock data provider — a straight Provider (not a Notifier) since nothing
/// on the home dashboard is mutated, matching the legacy `Homecontroller`
/// which never called `.obs`. Swap the body for a repository call once a
/// backend exists; the page never needs to change.

final class HomeCategoriesProvider
    extends
        $FunctionalProvider<
          List<HomeCategory>,
          List<HomeCategory>,
          List<HomeCategory>
        >
    with $Provider<List<HomeCategory>> {
  /// Mock data provider — a straight Provider (not a Notifier) since nothing
  /// on the home dashboard is mutated, matching the legacy `Homecontroller`
  /// which never called `.obs`. Swap the body for a repository call once a
  /// backend exists; the page never needs to change.
  HomeCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeCategoriesHash();

  @$internal
  @override
  $ProviderElement<List<HomeCategory>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<HomeCategory> create(Ref ref) {
    return homeCategories(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<HomeCategory> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<HomeCategory>>(value),
    );
  }
}

String _$homeCategoriesHash() => r'2e8e6729038a8710583a2c320f65e6b5254f84a2';

@ProviderFor(homeRecommendations)
final homeRecommendationsProvider = HomeRecommendationsProvider._();

final class HomeRecommendationsProvider
    extends
        $FunctionalProvider<
          List<RecommendedWorkout>,
          List<RecommendedWorkout>,
          List<RecommendedWorkout>
        >
    with $Provider<List<RecommendedWorkout>> {
  HomeRecommendationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeRecommendationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeRecommendationsHash();

  @$internal
  @override
  $ProviderElement<List<RecommendedWorkout>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<RecommendedWorkout> create(Ref ref) {
    return homeRecommendations(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RecommendedWorkout> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RecommendedWorkout>>(value),
    );
  }
}

String _$homeRecommendationsHash() =>
    r'167868147cf506565136e48801cd9c2a86967ce0';

@ProviderFor(homeArticles)
final homeArticlesProvider = HomeArticlesProvider._();

final class HomeArticlesProvider
    extends
        $FunctionalProvider<
          List<ArticleTip>,
          List<ArticleTip>,
          List<ArticleTip>
        >
    with $Provider<List<ArticleTip>> {
  HomeArticlesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeArticlesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeArticlesHash();

  @$internal
  @override
  $ProviderElement<List<ArticleTip>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<ArticleTip> create(Ref ref) {
    return homeArticles(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ArticleTip> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ArticleTip>>(value),
    );
  }
}

String _$homeArticlesHash() => r'698332484eb6e8c676dfc6edc4842b258b4a4a18';
