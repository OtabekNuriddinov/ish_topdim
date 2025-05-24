import 'package:flutter/material.dart';
import 'package:ish_topdim/features/home/filtering/steps/category/provider/category_provider.dart';
import 'package:ish_topdim/features/home/filtering/steps/for_whom/provider/for_whom_provider.dart';
import 'package:ish_topdim/features/home/filtering/steps/salary/provider/salary_provider.dart';
import 'package:ish_topdim/features/home/filtering/steps/work_time/provider/work_time_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'core/router/go_router.dart';

void main(){
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>CategoryProvider()),
        ChangeNotifierProvider(create: (_)=>ForWhomProvider()),
        ChangeNotifierProvider(create: (_)=>WorkTimeProvider()),
        ChangeNotifierProvider(create: (_)=>SalaryProvider())
      ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType){
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "Ish Topdim",
          routerConfig: router,
        );
      },
    );
  }
}
