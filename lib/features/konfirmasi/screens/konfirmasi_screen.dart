import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/layouts/main_layout.dart';
import '../providers/konfirmasi_provider.dart';
import '../widgets/order_table.dart';

class KonfirmasiScreen extends StatelessWidget {
  const KonfirmasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => KonfirmasiProvider(),
      child: const MainLayout(
        title: 'GERCEP Konfirmasi',
        selectedIndex: 1,
        child: KonfirmasiContent(),
      ),
    );
  }
}

class KonfirmasiContent extends StatelessWidget {
  const KonfirmasiContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30),
      child: OrderTable(),
    );
  }
}