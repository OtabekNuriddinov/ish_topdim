import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ish_topdim/core/components/main_back_button.dart';
import 'package:ish_topdim/core/theme/text_styles.dart';
import 'package:ish_topdim/features/home/notifications/components/notification_company_component.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MainBackButton(onPressed: () => context.pop()),
        title: Text(
          "Bildirishnoma",
          style: TextStyles.h2(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ListView(
          children: [
            Text("Bugun", style: TextStyles.h4()),
            const SizedBox(
              height: 10,
            ),
            const NotificationCompanyWidget(
                imageUrl:
                    "https://images-platform.99static.com/HRyw1kVJAYHiaDNIZUNxMMWfCy4=/1x0:1051x1050/500x500/top/smart/99designs-contests-attachments/97/97319/attachment_97319109",
                agency: "SMM Agency",
                detail:
                    "SMM Agentligiga Grafik Dizayner qidirilmoqda Abdulhamid iltimos to'g'ri yozing",
                time: "1 soat oldin"),
            const SizedBox(
              height: 10,
            ),
             Text("Kecha", style: TextStyles.h4()),
            const SizedBox(
              height: 10,
            ),
            const NotificationCompanyWidget(
                imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcj1wzUwx52Cvn8wO_QcPqwjg7iMnMyvs5n7hLt-INmYHefydHLNaVwosMZTKA9EywDtM&usqp=CAU",
                agency: "Kiym tikuv Sehi",
                detail:
                "SMM Agentligiga Grafik Dizayner qidirilmoqda Abdulhamid iltimos to'g'ri yozing",
                time: "26 soat oldin"),
          ],
        ),
      ),
    );
  }
}
