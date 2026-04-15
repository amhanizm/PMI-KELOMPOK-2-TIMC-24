import 'package:flutter/material.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/dashboard/screens/dashboard_screen.dart';
import '../features/konfirmasi/screens/konfirmasi_screen.dart';
import '../features/menu_management/screens/menu_screen.dart';
import '../features/pembayaran/screens/pembayaran_screen.dart';
import 'route_names.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case RouteNames.konfirmasi:
        return MaterialPageRoute(builder: (_) => const KonfirmasiScreen());
      case RouteNames.menu:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      case RouteNames.pembayaran:
        return MaterialPageRoute(builder: (_) => const PembayaranScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Halaman tidak ditemukan')),
          ),
        );
    }
  }
}