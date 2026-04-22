import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/layouts/main_layout.dart';
import '../providers/dashboard_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardProvider()..loadDashboard(),
      child: const MainLayout(
        title: 'Dashboard',
        selectedIndex: 0,
        child: DashboardContent(),
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _statCard(
              title: "Total Pendapatan",
              value: "Rp ${provider.totalPendapatan}",
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            _statCard(
              title: "Total Transaksi",
              value: provider.totalTransaksi.toString(),
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            _menuTerlaris(provider.menuTerlaris),
          ],
        );
      },
    );
  }

  Widget _statCard({required String title, required String value, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(value,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _menuTerlaris(Map<String, int> data) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Menu Terlaris",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...data.entries.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text("Menu ID ${e.key} : ${e.value}x"),
              )),
        ],
      ),
    );
  }
}
