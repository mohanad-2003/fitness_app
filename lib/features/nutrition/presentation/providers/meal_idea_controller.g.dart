// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_idea_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MealIdeaCategoryController)
final mealIdeaCategoryControllerProvider =
    MealIdeaCategoryControllerProvider._();

final class MealIdeaCategoryControllerProvider
    extends $NotifierProvider<MealIdeaCategoryController, MealCategory> {
  MealIdeaCategoryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mealIdeaCategoryControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mealIdeaCategoryControllerHash();

  @$internal
  @override
  MealIdeaCategoryController create() => MealIdeaCategoryController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MealCategory value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MealCategory>(value),
    );
  }
}

String _$mealIdeaCategoryControllerHash() =>
    r'd5d8dfad52c76a0f7b8bb4bc3d26b0cbc05a47d8';

abstract class _$MealIdeaCategoryController extends $Notifier<MealCategory> {
  MealCategory build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<MealCategory, MealCategory>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MealCategory, MealCategory>,
              MealCategory,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(mealIdeaSection)
final mealIdeaSectionProvider = MealIdeaSectionFamily._();

final class MealIdeaSectionProvider
    extends
        $FunctionalProvider<MealIdeaSection, MealIdeaSection, MealIdeaSection>
    with $Provider<MealIdeaSection> {
  MealIdeaSectionProvider._({
    required MealIdeaSectionFamily super.from,
    required MealCategory super.argument,
  }) : super(
         retry: null,
         name: r'mealIdeaSectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mealIdeaSectionHash();

  @override
  String toString() {
    return r'mealIdeaSectionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<MealIdeaSection> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MealIdeaSection create(Ref ref) {
    final argument = this.argument as MealCategory;
    return mealIdeaSection(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MealIdeaSection value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MealIdeaSection>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MealIdeaSectionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mealIdeaSectionHash() => r'31b96189d7afb70ee12f9534745bd8523164467c';

final class MealIdeaSectionFamily extends $Family
    with $FunctionalFamilyOverride<MealIdeaSection, MealCategory> {
  MealIdeaSectionFamily._()
    : super(
        retry: null,
        name: r'mealIdeaSectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MealIdeaSectionProvider call(MealCategory category) =>
      MealIdeaSectionProvider._(argument: category, from: this);

  @override
  String toString() => r'mealIdeaSectionProvider';
}

@ProviderFor(MealIdeaFavorites)
final mealIdeaFavoritesProvider = MealIdeaFavoritesProvider._();

final class MealIdeaFavoritesProvider
    extends $NotifierProvider<MealIdeaFavorites, Set<String>> {
  MealIdeaFavoritesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mealIdeaFavoritesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mealIdeaFavoritesHash();

  @$internal
  @override
  MealIdeaFavorites create() => MealIdeaFavorites();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$mealIdeaFavoritesHash() => r'f823cc808e1871c902bd5c08536a5b5e77cbfdf7';

abstract class _$MealIdeaFavorites extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
