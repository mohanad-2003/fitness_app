// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentUserProfile)
final currentUserProfileProvider = CurrentUserProfileProvider._();

final class CurrentUserProfileProvider
    extends $FunctionalProvider<UserProfile, UserProfile, UserProfile>
    with $Provider<UserProfile> {
  CurrentUserProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserProfileProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserProfileHash();

  @$internal
  @override
  $ProviderElement<UserProfile> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserProfile create(Ref ref) {
    return currentUserProfile(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserProfile value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserProfile>(value),
    );
  }
}

String _$currentUserProfileHash() =>
    r'7d32b47b8003b1b2b1cc451b32993637c793e0a9';

@ProviderFor(userDocuments)
final userDocumentsProvider = UserDocumentsProvider._();

final class UserDocumentsProvider
    extends
        $FunctionalProvider<
          List<DocumentItem>,
          List<DocumentItem>,
          List<DocumentItem>
        >
    with $Provider<List<DocumentItem>> {
  UserDocumentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userDocumentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userDocumentsHash();

  @$internal
  @override
  $ProviderElement<List<DocumentItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<DocumentItem> create(Ref ref) {
    return userDocuments(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DocumentItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DocumentItem>>(value),
    );
  }
}

String _$userDocumentsHash() => r'9c66ce656ea0cb1e20ef0141704a86820cadd036';
