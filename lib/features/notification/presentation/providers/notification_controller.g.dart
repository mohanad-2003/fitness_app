// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NotificationTabController)
final notificationTabControllerProvider = NotificationTabControllerProvider._();

final class NotificationTabControllerProvider
    extends $NotifierProvider<NotificationTabController, NotificationSection> {
  NotificationTabControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationTabControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationTabControllerHash();

  @$internal
  @override
  NotificationTabController create() => NotificationTabController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationSection value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationSection>(value),
    );
  }
}

String _$notificationTabControllerHash() =>
    r'711a8ef6e46399c4438a487d5a749b9a50f9ebfc';

abstract class _$NotificationTabController
    extends $Notifier<NotificationSection> {
  NotificationSection build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<NotificationSection, NotificationSection>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NotificationSection, NotificationSection>,
              NotificationSection,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(groupedNotifications)
final groupedNotificationsProvider = GroupedNotificationsProvider._();

final class GroupedNotificationsProvider
    extends
        $FunctionalProvider<
          Map<String, List<NotificationItem>>,
          Map<String, List<NotificationItem>>,
          Map<String, List<NotificationItem>>
        >
    with $Provider<Map<String, List<NotificationItem>>> {
  GroupedNotificationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupedNotificationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupedNotificationsHash();

  @$internal
  @override
  $ProviderElement<Map<String, List<NotificationItem>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<String, List<NotificationItem>> create(Ref ref) {
    return groupedNotifications(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, List<NotificationItem>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, List<NotificationItem>>>(
        value,
      ),
    );
  }
}

String _$groupedNotificationsHash() =>
    r'156d10502b58d8ad45738c6759e89a448d816791';
