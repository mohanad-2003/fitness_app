// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchTabController)
final searchTabControllerProvider = SearchTabControllerProvider._();

final class SearchTabControllerProvider
    extends $NotifierProvider<SearchTabController, SearchTab> {
  SearchTabControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchTabControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchTabControllerHash();

  @$internal
  @override
  SearchTabController create() => SearchTabController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchTab value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchTab>(value),
    );
  }
}

String _$searchTabControllerHash() =>
    r'1abb06eb5d90277ee42222d551a98e6dfc7578de';

abstract class _$SearchTabController extends $Notifier<SearchTab> {
  SearchTab build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SearchTab, SearchTab>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SearchTab, SearchTab>,
              SearchTab,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(searchFeaturedWorkouts)
final searchFeaturedWorkoutsProvider = SearchFeaturedWorkoutsProvider._();

final class SearchFeaturedWorkoutsProvider
    extends
        $FunctionalProvider<
          List<SearchResultItem>,
          List<SearchResultItem>,
          List<SearchResultItem>
        >
    with $Provider<List<SearchResultItem>> {
  SearchFeaturedWorkoutsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchFeaturedWorkoutsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchFeaturedWorkoutsHash();

  @$internal
  @override
  $ProviderElement<List<SearchResultItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<SearchResultItem> create(Ref ref) {
    return searchFeaturedWorkouts(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SearchResultItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SearchResultItem>>(value),
    );
  }
}

String _$searchFeaturedWorkoutsHash() =>
    r'9f0d998e2c8d1a48699305702505ffd155ec4deb';

@ProviderFor(searchAllResults)
final searchAllResultsProvider = SearchAllResultsProvider._();

final class SearchAllResultsProvider
    extends
        $FunctionalProvider<
          List<SearchResultItem>,
          List<SearchResultItem>,
          List<SearchResultItem>
        >
    with $Provider<List<SearchResultItem>> {
  SearchAllResultsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchAllResultsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchAllResultsHash();

  @$internal
  @override
  $ProviderElement<List<SearchResultItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<SearchResultItem> create(Ref ref) {
    return searchAllResults(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SearchResultItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SearchResultItem>>(value),
    );
  }
}

String _$searchAllResultsHash() => r'7974c753feee407d2b46cf28e67e203116191dd4';
