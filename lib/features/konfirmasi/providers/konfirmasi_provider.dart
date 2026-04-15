import 'package:flutter/material.dart';
import '../models/order_model.dart';

class KonfirmasiProvider with ChangeNotifier {
  List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  KonfirmasiProvider() {
    _loadDummyData();
  }

  void _loadDummyData() {
    _orders = [
      OrderModel(
        id: '1',
        meja: '3',
        pesanan: 'Aren Latte',
        addons: 'Pure matcha',
        harga: 27000,
        status: 'Diterima',
      ),
      // Bisa tambah data lain jika perlu
    ];
    notifyListeners();
  }

  void nextStatus(OrderModel order) {
    final index = _orders.indexWhere((o) => o.id == order.id);
    if (index == -1) return;

    switch (order.status) {
      case 'Diterima':
        _orders[index].status = 'Dibuat';
        break;
      case 'Dibuat':
        _orders[index].status = 'Disajikan';
        break;
      case 'Disajikan':
        // Opsional: looping kembali ke Diterima, atau biarkan tetap
        // _orders[index].status = 'Diterima';
        break;
    }
    notifyListeners();
  }

  // Untuk mendapatkan warna badge sesuai status
  Color getStatusColor(String status) {
    switch (status) {
      case 'Diterima':
        return const Color(0xFFA7A7A7);
      case 'Dibuat':
        return const Color(0xFFBFA66D);
      case 'Disajikan':
        return const Color(0xFF84B074);
      default:
        return Colors.grey;
    }
  }
}