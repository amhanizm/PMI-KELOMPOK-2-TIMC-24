import 'package:flutter/material.dart';
import 'package:sigercep_admin/core/services/supabase_service.dart';
import '../../transaksi/models/transaksi_model.dart';
import '../../transaksi/models/detail_transaksi_model.dart';

class KonfirmasiProvider extends ChangeNotifier {
  List<TransaksiModel> pesananMasuk = [];
  bool isLoading = false;

  Future<void> fetchPesanan() async {
    isLoading = true;
    notifyListeners();

    final data = await SupabaseService.getWhere(
      'transaksi',
      'status_pesanan',
      'pending',
    );

    pesananMasuk = data.map((e) => TransaksiModel.fromJson(e)).toList();

    isLoading = false;
    notifyListeners();
  }

  Future<List<DetailTransaksiModel>> getDetail(int idTransaksi) async {
    final data = await SupabaseService.getWhere(
      'detail_transaksi',
      'id_transaksi',
      idTransaksi,
    );

    return data.map((e) => DetailTransaksiModel.fromJson(e)).toList();
  }

  Future<void> updateStatus(int idTransaksi, String status) async {
    await SupabaseService.update(
      'transaksi',
      'id_transaksi',
      idTransaksi,
      {'status_pesanan': status},
    );

    await fetchPesanan();
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return const Color(0xFFA7A7A7);
      case 'proses':
        return const Color(0xFFBFA66D);
      case 'done':
        return const Color(0xFF84B074);
      default:
        return Colors.grey;
    }
  }
}
