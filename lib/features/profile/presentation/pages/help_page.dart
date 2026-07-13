import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

/// Navigation args for [HelpPage], passed via GoRouter `extra` so callers
/// (e.g. Privacy → Contact Support) can land directly on the Contact tab.
class HelpPageArgs {
  const HelpPageArgs({this.startOnContact = false});
  final bool startOnContact;
}

class HelpPage extends StatefulWidget {
  const HelpPage({super.key, this.args = const HelpPageArgs()});

  final HelpPageArgs args;

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  late bool _isContactUsExpanded = widget.args.startOnContact;
  int _selectedTabIndex = 0;
  int? _expandedFaqIndex;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final tabs = [
      l10n.helpTabGeneral,
      l10n.helpTabAccount,
      l10n.helpTabServices,
    ];
    final contactOptions = [
      (l10n.helpContactCustomerService, 'assets/customer.png', 'support@fitbody.app'),
      (l10n.helpContactWebsite, 'assets/website.png', 'www.fitbody.app'),
      (l10n.helpContactWhatsapp, 'assets/whats.png', '+1 555 010 2024'),
      (l10n.helpContactFacebook, 'assets/face_help.png', '@fitbody'),
      (l10n.helpContactInstagram, 'assets/insta.png', '@fitbody'),
    ];
    final faqs = [
      (l10n.helpFaqQ1, l10n.helpFaqA1),
      (l10n.helpFaqQ2, l10n.helpFaqA2),
      (l10n.helpFaqQ3, l10n.helpFaqA3),
      (l10n.helpFaqQ4, l10n.helpFaqA4),
      (l10n.helpFaqQ5, l10n.helpFaqA5),
    ];

    return PremiumScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => context.canPop() ? context.pop() : null,
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: theme.colorScheme.primary,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.helpTitle,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Center(
              child: Text(
                l10n.helpHowCanWeHelp,
                style: TextStyle(fontSize: 20, color: ext.textPrimary),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _ToggleButton(
                  text: l10n.helpFaqTab,
                  isSelected: !_isContactUsExpanded,
                  onTap: () => setState(() => _isContactUsExpanded = false),
                ),
                const SizedBox(width: 12),
                _ToggleButton(
                  text: l10n.helpContactUsTab,
                  isSelected: _isContactUsExpanded,
                  onTap: () => setState(() => _isContactUsExpanded = true),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_isContactUsExpanded)
              Column(
                children: [
                  for (final option in contactOptions)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () => _copyContact(context, option.$1, option.$3),
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: theme.colorScheme.secondary,
                        child: Image.asset(option.$2, width: 20, height: 20),
                      ),
                      title: Text(
                        option.$1,
                        style: TextStyle(color: ext.textPrimary, fontSize: 16),
                      ),
                      subtitle: Text(
                        option.$3,
                        style: TextStyle(color: ext.textMuted, fontSize: 12),
                      ),
                      trailing: Icon(
                        Icons.copy_rounded,
                        color: theme.colorScheme.primary,
                        size: 18,
                      ),
                    ),
                ],
              )
            else ...[
              Row(
                children: List.generate(
                  tabs.length,
                  (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedTabIndex = index),
                        child: Container(
                          height: 36,
                          decoration: BoxDecoration(
                            color:
                                _selectedTabIndex == index
                                    ? theme.colorScheme.primary
                                    : ext.glassFill,
                            borderRadius: BorderRadius.circular(20),
                            border:
                                _selectedTabIndex == index
                                    ? null
                                    : Border.all(color: ext.glassBorder),
                          ),
                          child: Center(
                            child: Text(
                              tabs[index],
                              style: TextStyle(
                                color:
                                    _selectedTabIndex == index
                                        ? theme.colorScheme.onPrimary
                                        : ext.textPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: theme.colorScheme.secondary,
                  ),
                  hintText: l10n.helpSearchHint,
                ),
              ),
              const SizedBox(height: 25),
              for (var i = 0; i < faqs.length; i++)
                _FaqItem(
                  question: faqs[i].$1,
                  answer: faqs[i].$2,
                  expanded: _expandedFaqIndex == i,
                  onTap:
                      () => setState(
                        () =>
                            _expandedFaqIndex =
                                _expandedFaqIndex == i ? null : i,
                      ),
                ),
            ],
          ],
        ),
      ),
    );
  }

  void _copyContact(BuildContext context, String label, String value) {
    Clipboard.setData(ClipboardData(text: value));
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context).helpContactCopied(value)),
        backgroundColor: ext.cardColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  const _ToggleButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final theme = Theme.of(context);
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 32,
          decoration: BoxDecoration(
            color: isSelected ? theme.colorScheme.primary : ext.glassFill,
            borderRadius: BorderRadius.circular(20),
            border: isSelected ? null : Border.all(color: ext.glassBorder),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color:
                    isSelected ? theme.colorScheme.onPrimary : ext.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  const _FaqItem({
    required this.question,
    required this.answer,
    required this.expanded,
    required this.onTap,
  });

  final String question;
  final String answer;
  final bool expanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final theme = Theme.of(context);
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  question,
                  style: TextStyle(
                    color: ext.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Icon(
                expanded
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
        ),
        if (expanded) ...[
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              answer,
              style: TextStyle(color: ext.textMuted, fontSize: 13, height: 1.5),
            ),
          ),
        ],
        const SizedBox(height: 10),
        Divider(color: ext.glassBorder, thickness: 1),
        const SizedBox(height: 10),
      ],
    );
  }
}
