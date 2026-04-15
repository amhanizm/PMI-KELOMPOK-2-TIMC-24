import 'package:flutter/material.dart';
import '../models/payment_model.dart';

class PembayaranProvider with ChangeNotifier {
  List<PaymentModel> _pembayaranMasuk = [];
  List<PaymentModel> _riwayatTransaksi = [];

  List<PaymentModel> get pembayaranMasuk => _pembayaranMasuk;
  List<PaymentModel> get riwayatTransaksi => _riwayatTransaksi;

  PembayaranProvider() {
    _loadDummyData();
  }

  void _loadDummyData() {
    // Data Pembayaran Masuk (Menunggu)
    _pembayaranMasuk = [
      PaymentModel(
        id: '1',
        meja: '03',
        pesanan: 'Aren Latte',
        addons: 'Pure matcha',
        harga: 27000,
        status: 'Menunggu',
      ),
    ];

    // Data Riwayat Transaksi (Lunas)
    _riwayatTransaksi = [
      PaymentModel(
        id: '2',
        meja: '03',
        pesanan: 'Aren Latte',
        addons: 'Pure matcha',
        harga: 27000,
        status: 'Lunas',
      ),
      PaymentModel(
        id: '3',
        meja: '03',
        pesanan: 'Aren Latte',
        addons: '-',
        harga: 20000,
        status: 'Lunas',
      ),
      PaymentModel(
        id: '4',
        meja: '03',
        pesanan: 'Aren Latte',
        addons: '-',
        harga: 20000,
        status: 'Lunas',
      ),
    ];
    notifyListeners();
  }

  // Warna badge sesuai status
  Color getStatusColor(String status) {
    switch (status) {
      case 'Menunggu':
        return const Color(0xFFA7A7A7);
      case 'Lunas':
        return const Color(0xFF84B074);
      default:
        return Colors.grey;
    }
  }
}