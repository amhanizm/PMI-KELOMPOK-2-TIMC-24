import 'package:flutter/material.dart';
import 'package:sigercep_admin/core/services/supabase_service.dart';
import '../../transaksi/models/transaksi_model.dart';
import '../../transaksi/models/detail_transaksi_model.dart';

class PembayaranProvider extends ChangeNotifier {
  List<TransaksiModel> pembayaranPending = [];
  bool isLoading = false;

  Future<void> fetchPembayaran() async {
    isLoading = true;
    notifyListeners();

    final data = await SupabaseService.getWhere(
      'transaksi',
      'status_bayar',
      'pending',
    );

    pembayaranPending = data.map((e) => TransaksiModel.fromJson(e)).toList();

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

  Future<void> konfirmasiPembayaran(int idTransaksi) async {
    await SupabaseService.update(
      'transaksi',
      'id_transaksi',
      idTransaksi,
      {'status_bayar': 'done'},
    );

    await fetchPembayaran();
  }
}
