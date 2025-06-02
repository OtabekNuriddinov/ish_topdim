import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/themes.dart';
import 'expansion_item.dart';

class ChooseExpansionTile extends StatelessWidget {
  final List<String> items;
  final String selectedText;
  final ExpansionTileController controller;
  final Function(String) onItemSelected;

  const ChooseExpansionTile({
    super.key,
    required this.items,
    required this.selectedText,
    required this.controller,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Consumer<SettingsProvider>(
          builder: (context, provider, __) {
            return ExpansionTile(
              backgroundColor: !provider.isDarkMode ? Color(0xFFE6E6E6) : Colors.grey.withAlpha(30),
              controller: controller,
              tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              collapsedIconColor: provider.isDarkMode ? Themes.white : Themes.black57,
              iconColor: provider.isDarkMode ? Themes.white : Themes.black57,
              title: Text(
                selectedText,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: provider.isDarkMode ? Themes.white : Themes.black57
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: items
                        .map(
                          (item) => Padding(
                        padding: EdgeInsets.only(bottom: 0.5.h),
                        child: ExpansionItem(
                          text: item,
                          onPressed: () {
                            onItemSelected(item);
                            controller.collapse();
                          },
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
