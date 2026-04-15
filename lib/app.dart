import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';
import 'routes/app_router.dart';
import 'routes/route_names.dart';

class GercepAdminApp extends StatelessWidget {
  const GercepAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gercep Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryBlue,
        scaffoldBackgroundColor: AppColors.backgroundLight,
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primaryBlue,
          secondary: AppColors.accentYellow,
        ),
      ),
      initialRoute: RouteNames.login,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}