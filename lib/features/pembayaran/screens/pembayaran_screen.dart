import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/layouts/main_layout.dart';
import '../providers/pembayaran_provider.dart';
import '../widgets/payment_tab_bar.dart';
import '../widgets/payment_table.dart';

class PembayaranScreen extends StatefulWidget {
  const PembayaranScreen({super.key});

  @override
  State<PembayaranScreen> createState() => _PembayaranScreenState();
}

class _PembayaranScreenState extends State<PembayaranScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PembayaranProvider(),
      child: MainLayout(
        title: 'GERCEP Pembayaran',
        selectedIndex: 3,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Consumer<PembayaranProvider>(
            builder: (context, provider, _) {
              final data = _selectedTab == 0
                  ? provider.pembayaranMasuk
                  : provider.riwayatTransaksi;

              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    PaymentTabBar(
                      selectedIndex: _selectedTab,
                      onTabChanged: (index) {
                        setState(() {
                          _selectedTab = index;
                        });
                      },
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: PaymentTable(data: data),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}