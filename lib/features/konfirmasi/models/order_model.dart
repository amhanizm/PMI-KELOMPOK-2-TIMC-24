class OrderModel {
  final String id;
  final String meja;
  final String pesanan;
  final String addons;
  final int harga;
  String status; // 'Diterima', 'Dibuat', 'Disajikan'

  OrderModel({
    required this.id,
    required this.meja,
    required this.pesanan,
    required this.addons,
    required this.harga,
    required this.status,
  });

  // Format harga ke Rupiah
  String get formattedHarga => 'Rp ${harga.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}';
}