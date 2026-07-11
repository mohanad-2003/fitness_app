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
    final match = supportedLocales.where((l) => l.languageCode == stored);
    return match.isNotEmpty ? match.first : supportedLocales.first;
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    await ref.read(preferencesServiceProvider).setLocale(locale.languageCode);
  }
}
