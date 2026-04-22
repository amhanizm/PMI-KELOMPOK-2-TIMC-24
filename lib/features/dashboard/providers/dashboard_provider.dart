import 'package:flutter/material.dart';
import 'package:sigercep_admin/core/services/supabase_service.dart';

class DashboardProvider extends ChangeNotifier {
  int totalTransaksi = 0;
  int totalPendapatan = 0;
  Map<String, int> menuTerlaris = {};
  bool isLoading = false;

  Future<void> loadDashboard() async {
    isLoading = true;
    notifyListeners();

    // Ambil semua transaksi yang sudah selesai
    final transaksi = await SupabaseService.getWhere(
      'transaksi',
      'status_bayar',
      'done',
    );

    totalTransaksi = transaksi.length;

    // Hitung total pendapatan
    totalPendapatan = transaksi.fold(
      0,
      (sum, item) => sum + (item['total_bayar'] as int),
    );

    // Ambil detail transaksi untuk hitung menu terlaris
    final detail = await SupabaseService.getData('detail_transaksi');

    final Map<String, int> counter = {};

    for (var d in detail) {
      final idMenu = d['id_menu'].toString();
      final jumlah = d['jumlah'] as int;

      counter[idMenu] = (counter[idMenu] ?? 0) + jumlah;
    }

    menuTerlaris = counter;

    isLoading = false;
    notifyListeners();
  }
}
