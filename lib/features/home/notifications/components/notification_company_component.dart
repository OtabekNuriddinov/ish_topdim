import 'package:flutter/material.dart';

import '../../../../core/components/pp_image_card.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/themes.dart';

class NotificationCompanyWidget extends StatelessWidget {
  const NotificationCompanyWidget({super.key, required this.imageUrl, required this.agency, required this.detail, required this.time});
  final String imageUrl;
  final String agency;
  final String detail;
  final String time;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PpImageCard(
                  imageUrl:
                  imageUrl),
              const SizedBox(width: 8),
              Text(
                agency,
                style: TextStyles.h4(),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  color: Themes.grey,
                  size: 30,
                ),
              ),
            ],
          ),
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            detail,
            style: TextStyles.h6(color: Themes.greyText),
          ),
          Text(time ,style: TextStyles.h9(color: Themes.orange),)
        ],
      ),
    );
  }
}
