class PaymentModel {
  final String id;
  final String meja;
  final String pesanan;
  final String addons;
  final int harga;
  final String status; // 'Menunggu' atau 'Lunas'

  PaymentModel({
    required this.id,
    required this.meja,
    required this.pesanan,
    required this.addons,
    required this.harga,
    required this.status,
  });

  String get formattedHarga => 'Rp ${harga.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}';
}