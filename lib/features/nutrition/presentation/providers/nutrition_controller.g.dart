// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NutritionTabController)
final nutritionTabControllerProvider = NutritionTabControllerProvider._();

final class NutritionTabControllerProvider
    extends $NotifierProvider<NutritionTabController, NutritionTab> {
  NutritionTabControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nutritionTabControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nutritionTabControllerHash();

  @$internal
  @override
  NutritionTabController create() => NutritionTabController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NutritionTab value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NutritionTab>(value),
    );
  }
}

String _$nutritionTabControllerHash() =>
    r'0868b563d44ec6fd0087fdde7045f86827459de9';

abstract class _$NutritionTabController extends $Notifier<NutritionTab> {
  NutritionTab build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<NutritionTab, NutritionTab>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NutritionTab, NutritionTab>,
              NutritionTab,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(nutritionRecommended)
final nutritionRecommendedProvider = NutritionRecommendedProvider._();

final class NutritionRecommendedProvider
    extends $FunctionalProvider<List<MealItem>, List<MealItem>, List<MealItem>>
    with $Provider<List<MealItem>> {
  NutritionRecommendedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nutritionRecommendedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nutritionRecommendedHash();

  @$internal
  @override
  $ProviderElement<List<MealItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<MealItem> create(Ref ref) {
    return nutritionRecommended(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<MealItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<MealItem>>(value),
    );
  }
}

String _$nutritionRecommendedHash() =>
    r'26106e4ad8673f03c99f4ce93a7eacc64f678abd';

@ProviderFor(nutritionRecipes)
final nutritionRecipesProvider = NutritionRecipesProvider._();

final class NutritionRecipesProvider
    extends $FunctionalProvider<List<MealItem>, List<MealItem>, List<MealItem>>
    with $Provider<List<MealItem>> {
  NutritionRecipesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nutritionRecipesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nutritionRecipesHash();

  @$internal
  @override
  $ProviderElement<List<MealItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<MealItem> create(Ref ref) {
    return nutritionRecipes(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<MealItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<MealItem>>(value),
    );
  }
}

String _$nutritionRecipesHash() => r'd1686acc4ab4aebda9d48f24b3adbd022d01bbd8';
