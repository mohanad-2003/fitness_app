import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:flutter/material.dart';

enum LegalDocumentType { privacyPolicy, terms }

/// Generic reader for the two static legal documents reachable from
/// Profile → Privacy — replaces the "coming soon" snackbar stubs that used
/// to sit behind the Privacy Policy / Terms & Conditions tiles.
class LegalDocumentPage extends StatelessWidget {
  const LegalDocumentPage({super.key, required this.type});

  final LegalDocumentType type;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);
    final title = switch (type) {
      LegalDocumentType.privacyPolicy => l10n.privacyPolicy,
      LegalDocumentType.terms => l10n.privacyTerms,
    };
    final body = switch (type) {
      LegalDocumentType.privacyPolicy => l10n.legalPrivacyPolicyBody,
      LegalDocumentType.terms => l10n.legalTermsBody,
    };

    return PremiumScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (Navigator.of(context).canPop())
                PremiumIconButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () => Navigator.of(context).pop(),
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: ext.textPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: PremiumGlassCard(
                child: Text(
                  body,
                  style: TextStyle(
                    color: ext.textMuted,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
