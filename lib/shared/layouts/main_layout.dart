import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';
import '../../core/utils/date_formatter.dart';
import '../../features/auth/providers/auth_provider.dart';
import '../../routes/route_names.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final String title;
  final int selectedIndex;

  const MainLayout({
    super.key,
    required this.child,
    required this.title,
    required this.selectedIndex,
  });

  void _navigateTo(BuildContext context, String routeName) {
    if (ModalRoute.of(context)?.settings.name != routeName) {
      Navigator.pushReplacementNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final currentDate = DateFormatter.getCurrentDate();

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 260,
            color: AppColors.primaryBlue,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo dan Nama Brand
                Center(
                  child: Column(
                    children: [
                      // Logo placeholder (nanti ganti Image.asset)
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.restaurant_menu,
                          color: AppColors.primaryBlue,
                          size: 36,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'GERCEP SIGNATURE',
                        style: AppStyles.bodyText.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // Menu Items
                _buildMenuItem(
                  context,
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                  isActive: selectedIndex == 0,
                  onTap: () => _navigateTo(context, RouteNames.dashboard),
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.shopping_cart,
                  label: 'Konfirmasi Pesanan',
                  isActive: selectedIndex == 1,
                  onTap: () => _navigateTo(context, RouteNames.konfirmasi),
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.restaurant,
                  label: 'Menu Management',
                  isActive: selectedIndex == 2,
                  onTap: () => _navigateTo(context, RouteNames.menu),
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.payment,
                  label: 'Pembayaran',
                  isActive: selectedIndex == 3,
                  onTap: () => _navigateTo(context, RouteNames.pembayaran),
                ),
              ],
            ),
          ),
          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Header
                Container(
                  padding: AppStyles.pagePadding,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Judul Halaman & Tanggal
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: AppStyles.heading1),
                          const SizedBox(height: 4),
                          Text(
                            currentDate,
                            style: AppStyles.caption,
                          ),
                        ],
                      ),
                      // User Profile & Logout
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                auth.currentUser?.role ?? 'Admin',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                auth.currentUser?.name ?? 'Guest',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textDark,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 15),
                          const Icon(
                            Icons.account_circle,
                            size: 38,
                            color: AppColors.primaryBlue,
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(
                              Icons.logout,
                              color: AppColors.primaryBlue,
                              size: 24,
                            ),
                            onPressed: () async {
                              await auth.logout();
                              Navigator.pushReplacementNamed(
                                context,
                                RouteNames.login,
                              );
                            },
                            tooltip: 'Logout',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Content Area
                Expanded(
                  child: Container(
                    color: AppColors.backgroundLight,
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              color: isActive ? AppColors.accentYellow : null,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isActive ? AppColors.primaryBlue : Colors.white,
                  size: 18,
                ),
                const SizedBox(width: 15),
                Text(
                  label,
                  style: TextStyle(
                    color: isActive ? AppColors.primaryBlue : Colors.white,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}