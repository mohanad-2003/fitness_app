import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  bool _isContactUsExpanded = false;
  int _selectedTabIndex = 0;

  static const _tabs = ['General', 'Account', 'Services'];
  static const _contactOptions = [
    ('Customer Service', 'assets/customer.png'),
    ('Website', 'assets/website.png'),
    ('Whatsapp', 'assets/whats.png'),
    ('Facebook', 'assets/face_help.png'),
    ('Instagram', 'assets/insta.png'),
  ];

  @override
  Widget build(BuildContext context) {
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
                    color: AppColors.seedLime,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Help & FAQs',
                  style: TextStyle(
                    color: AppColors.seedViolet,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Center(
              child: Text(
                'How can we help you?',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _ToggleButton(
                  text: 'FAQ',
                  isSelected: !_isContactUsExpanded,
                  onTap: () => setState(() => _isContactUsExpanded = false),
                ),
                const SizedBox(width: 12),
                _ToggleButton(
                  text: 'Contact Us',
                  isSelected: _isContactUsExpanded,
                  onTap: () => setState(() => _isContactUsExpanded = true),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_isContactUsExpanded)
              Column(
                children: [
                  for (final option in _contactOptions)
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.seedViolet,
                        child: Image.asset(option.$2, width: 20, height: 20),
                      ),
                      title: Text(
                        option.$1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.seedLime,
                      ),
                    ),
                ],
              ),
            const SizedBox(height: 20),
            Row(
              children: List.generate(
                _tabs.length,
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
                                  ? AppColors.seedLime
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            _tabs[index],
                            style: TextStyle(
                              color:
                                  _selectedTabIndex == index
                                      ? Colors.black
                                      : AppColors.seedViolet,
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
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: AppColors.seedViolet),
                hintText: 'Search',
              ),
            ),
            const SizedBox(height: 25),
            for (var i = 0; i < 5; i++)
              const _FaqItem('Lorem ipsum dolor sit amet?'),
          ],
        ),
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
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 32,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.seedLime : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? Colors.black : AppColors.seedViolet,
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
  const _FaqItem(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xffB3A0FF),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_drop_down_rounded,
              color: AppColors.seedLime,
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(color: AppColors.seedLime, thickness: 1),
        const SizedBox(height: 10),
      ],
    );
  }
}
