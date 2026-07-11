// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_challenge_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(weeklyChallengeRoundOne)
final weeklyChallengeRoundOneProvider = WeeklyChallengeRoundOneProvider._();

final class WeeklyChallengeRoundOneProvider
    extends
        $FunctionalProvider<
          List<WeeklyRound>,
          List<WeeklyRound>,
          List<WeeklyRound>
        >
    with $Provider<List<WeeklyRound>> {
  WeeklyChallengeRoundOneProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weeklyChallengeRoundOneProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weeklyChallengeRoundOneHash();

  @$internal
  @override
  $ProviderElement<List<WeeklyRound>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<WeeklyRound> create(Ref ref) {
    return weeklyChallengeRoundOne(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<WeeklyRound> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<WeeklyRound>>(value),
    );
  }
}

String _$weeklyChallengeRoundOneHash() =>
    r'0f7f902b0143d0b4c2bbbeb93dc002e136a71566';

@ProviderFor(weeklyChallengeRoundTwo)
final weeklyChallengeRoundTwoProvider = WeeklyChallengeRoundTwoProvider._();

final class WeeklyChallengeRoundTwoProvider
    extends
        $FunctionalProvider<
          List<WeeklyRound>,
          List<WeeklyRound>,
          List<WeeklyRound>
        >
    with $Provider<List<WeeklyRound>> {
  WeeklyChallengeRoundTwoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weeklyChallengeRoundTwoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weeklyChallengeRoundTwoHash();

  @$internal
  @override
  $ProviderElement<List<WeeklyRound>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<WeeklyRound> create(Ref ref) {
    return weeklyChallengeRoundTwo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<WeeklyRound> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<WeeklyRound>>(value),
    );
  }
}

String _$weeklyChallengeRoundTwoHash() =>
    r'0be4afcc32855a3e33ae536e9b1a005626529939';
