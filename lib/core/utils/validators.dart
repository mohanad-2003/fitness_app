import 'package:flutter/widgets.dart';

import '../localization/generated/app_localizations.dart';

/// Shared, localized form validators. Each factory takes the current
/// [AppLocalizations] so error messages follow the active locale.
abstract final class Validators {
  static final _emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static String? Function(String?) email(AppLocalizations l10n) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return l10n.validationEmailRequired;
      }
      if (!_emailPattern.hasMatch(value)) return l10n.validationEmailInvalid;
      return null;
    };
  }

  static String? Function(String?) password(AppLocalizations l10n) {
    return (value) {
      if (value == null || value.isEmpty) return l10n.validationPasswordRequired;
      if (value.length < 8) return l10n.validationPasswordTooShort;
      return null;
    };
  }

  /// Non-empty check. Pass a specific [message] (e.g.
  /// `l10n.validationFullNameRequired`) to override the generic one.
  static String? Function(String?) requiredField(
    AppLocalizations l10n, {
    String? message,
  }) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return message ?? l10n.validationFieldRequired;
      }
      return null;
    };
  }

  static String? Function(String?) matches(
    AppLocalizations l10n,
    TextEditingController other,
  ) {
    return (value) {
      if (value == null || value.isEmpty) return l10n.validationFieldRequired;
      if (value != other.text) return l10n.validationPasswordMismatch;
      return null;
    };
  }
}
