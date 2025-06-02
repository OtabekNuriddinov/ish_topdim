import 'package:flutter/material.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../libs/change_theme_libs.dart';

class ChangeThemeScreen extends StatefulWidget {
  const ChangeThemeScreen({super.key});

  @override
  State<ChangeThemeScreen> createState() => _ChangeThemeScreenState();
}

class _ChangeThemeScreenState extends State<ChangeThemeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: MainBackButton(onPressed: () {
          context.pop(context);
        }),
        title: Text("Temani o'zgartirish", style: theme.textTheme.titleLarge),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Qanday temani tanlaysiz?",
              style: theme.textTheme.headlineMedium,
            ),
            SizedBox(height: 2.h),
            Consumer<SettingsProvider>(
              builder: (context, provider, __) {
                return AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Column(
                      children: [
                        _buildThemeOption(
                          context,
                          title: "Kun",
                          subtitle: "Yorug' mavzu",
                          icon: Icons.light_mode,
                          isSelected: !provider.isDarkMode,
                          onTap: () async {
                            if (provider.isDarkMode) {
                              await _controller.forward();
                              await provider.setLight();
                              _controller.reset();
                            }
                          },
                        ),
                        SizedBox(height: 1.h),
                        _buildThemeOption(
                          context,
                          title: "Tun",
                          subtitle: "Qorong'u mavzu",
                          icon: Icons.dark_mode,
                          isSelected: provider.isDarkMode,
                          onTap: () async {
                            if (!provider.isDarkMode) {
                              await _controller.forward();
                              await provider.setDark();
                              _controller.reset();
                            }
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(2.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? theme.colorScheme.primary : theme.dividerColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: isSelected ? theme.colorScheme.primary : theme.iconTheme.color,
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: isSelected ? theme.colorScheme.primary : null,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: theme.colorScheme.primary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
