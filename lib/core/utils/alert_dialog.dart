import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../theme/text_styles.dart';
import '../theme/themes.dart';

sealed class AppDialog {
  static Future<dynamic> showMyDialog({
    required BuildContext context,
    required String mainText,
    required String subText,
    required leftButText,
    required rightButText,
    required void Function() pressLeft,
    required void Function() pressRight,
  }) {
    return showDialog(

        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Themes.black57,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  mainText,
                  style: TextStyles.h2(color: Themes.white),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    subText,
                    style: TextStyles.h5(color: Themes.white),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Color(0xFF0A1724)),
                      onPressed: pressLeft,
                      child: Text(
                        leftButText,
                        style: TextStyles.h4(color: Themes.orange),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Themes.orange),
                      onPressed: pressRight,
                      child: Text(
                        rightButText,
                        style: TextStyles.h4(color: Themes.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
