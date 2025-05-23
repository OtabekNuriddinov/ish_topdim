import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ish_topdim/core/components/bottom_appbar.dart';

import '../../home/presentation/home_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.child, required this.currentIndex});

  final Widget child;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(padding: EdgeInsets.all(10),
      child: child),
      bottomNavigationBar: CustomBottomAppBar(
        onChanged: (index) {
          print(index);
          if(currentIndex !=index){
            String page = switch (index) {
              0 => "/home",
              1 => "/favorite",
              _ => "/home",
            };
            context.go(page);
          }
        },
      ),
    );
  }
}
