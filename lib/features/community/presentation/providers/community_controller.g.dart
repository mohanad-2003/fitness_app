// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CommunityTabController)
final communityTabControllerProvider = CommunityTabControllerProvider._();

final class CommunityTabControllerProvider
    extends $NotifierProvider<CommunityTabController, CommunityTab> {
  CommunityTabControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communityTabControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communityTabControllerHash();

  @$internal
  @override
  CommunityTabController create() => CommunityTabController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommunityTab value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommunityTab>(value),
    );
  }
}

String _$communityTabControllerHash() =>
    r'c72ac38b235f539e1e69eaa07636dda2f0236c9f';

abstract class _$CommunityTabController extends $Notifier<CommunityTab> {
  CommunityTab build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CommunityTab, CommunityTab>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CommunityTab, CommunityTab>,
              CommunityTab,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(communityChallenges)
final communityChallengesProvider = CommunityChallengesProvider._();

final class CommunityChallengesProvider
    extends
        $FunctionalProvider<
          List<ChallengeItem>,
          List<ChallengeItem>,
          List<ChallengeItem>
        >
    with $Provider<List<ChallengeItem>> {
  CommunityChallengesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communityChallengesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communityChallengesHash();

  @$internal
  @override
  $ProviderElement<List<ChallengeItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ChallengeItem> create(Ref ref) {
    return communityChallenges(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ChallengeItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ChallengeItem>>(value),
    );
  }
}

String _$communityChallengesHash() =>
    r'0a9d6e1e2a48902b4cdd17b14d01f9f7cfca160b';

@ProviderFor(communityForums)
final communityForumsProvider = CommunityForumsProvider._();

final class CommunityForumsProvider
    extends
        $FunctionalProvider<
          List<ForumThread>,
          List<ForumThread>,
          List<ForumThread>
        >
    with $Provider<List<ForumThread>> {
  CommunityForumsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communityForumsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communityForumsHash();

  @$internal
  @override
  $ProviderElement<List<ForumThread>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ForumThread> create(Ref ref) {
    return communityForums(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ForumThread> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ForumThread>>(value),
    );
  }
}

String _$communityForumsHash() => r'6b6293520baf3b5c3c2a7acdbe3325ebb3efb415';
