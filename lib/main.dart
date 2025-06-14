import 'package:flutter/material.dart';
import 'package:ish_topdim/core/theme/app_theme.dart';
import 'package:ish_topdim/features/home/filtering/steps/category/provider/category_provider.dart';
import 'package:ish_topdim/features/home/filtering/steps/for_whom/provider/for_whom_provider.dart';
import 'package:ish_topdim/features/home/filtering/steps/salary/provider/salary_provider.dart';
import 'package:ish_topdim/features/home/filtering/steps/work_time/provider/work_time_provider.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'core/router/go_router.dart';
import 'features/home/filtering/provider/filter_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ForWhomProvider()),
        ChangeNotifierProvider(create: (_) => WorkTimeProvider()),
        ChangeNotifierProvider(create: (_) => SalaryProvider()),
        ChangeNotifierProxyProvider4<CategoryProvider, ForWhomProvider, WorkTimeProvider, SalaryProvider, FilterProvider>(
          create: (context) => FilterProvider(
            categoryProvider: context.read<CategoryProvider>(),
            forWhomProvider: context.read<ForWhomProvider>(),
            workTimeProvider: context.read<WorkTimeProvider>(),
            salaryProvider: context.read<SalaryProvider>(),
          ),
          update: (context, categoryProvider, forWhomProvider, workTimeProvider, salaryProvider, previous) => 
            FilterProvider(
              categoryProvider: categoryProvider,
              forWhomProvider: forWhomProvider,
              workTimeProvider: workTimeProvider,
              salaryProvider: salaryProvider,
            ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return Consumer<SettingsProvider>(
          builder: (context, provider, __) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: "Ish Topdim",
              routerConfig: router,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: provider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              builder: (context, child) {
                return Theme(
                  data: provider.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
                  child: child!,
                );
              },
            );
          }
        );
      },
    );
  }
}
