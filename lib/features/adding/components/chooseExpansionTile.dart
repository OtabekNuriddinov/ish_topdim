import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/text_styles.dart';
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
        color: const Color(0xFFE6E6E6),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          controller: controller,
          tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          collapsedIconColor: Colors.black,
          iconColor: Colors.black,
          title: Text(
            selectedText,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              color: const Color(0xFFC2C2C2),
              fontSize: 16.sp,
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
        ),
      ),
    );
  }
}
