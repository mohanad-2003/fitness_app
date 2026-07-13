import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../storage/preferences_service.dart';

part 'locale_controller.g.dart';

const supportedLocales = [Locale('en'), Locale('ar')];

@Riverpod(keepAlive: true)
class LocaleController extends _$LocaleController {
  @override
  Locale build() {
    final stored = ref.watch(preferencesServiceProvider).locale;
    if (stored != null) {
      final match = supportedLocales.where((l) => l.languageCode == stored);
      if (match.isNotEmpty) return match.first;
    }
    // No saved preference yet (first launch) — follow the device locale if
    // it's one we support, otherwise fall back to English.
    final deviceLanguageCode =
        WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    final deviceMatch = supportedLocales.where(
      (l) => l.languageCode == deviceLanguageCode,
    );
    return deviceMatch.isNotEmpty ? deviceMatch.first : supportedLocales.first;
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    await ref.read(preferencesServiceProvider).setLocale(locale.languageCode);
  }
}
