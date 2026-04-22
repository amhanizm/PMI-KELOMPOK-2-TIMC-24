class TransaksiModel {
  final int idTransaksi;
  final int idAdmin;
  final int idPelanggan;
  final int idMeja;
  final DateTime tglTransaksi;
  final num totalBayar;
  final String metodeBayar;
  final String statusBayar;
  final String statusPesanan;

  TransaksiModel({
    required this.idTransaksi,
    required this.idAdmin,
    required this.idPelanggan,
    required this.idMeja,
    required this.tglTransaksi,
    required this.totalBayar,
    required this.metodeBayar,
    required this.statusBayar,
    required this.statusPesanan,
  });

  factory TransaksiModel.fromJson(Map<String, dynamic> json) {
    return TransaksiModel(
      idTransaksi: json['id_transaksi'],
      idAdmin: json['id_admin'],
      idPelanggan: json['id_pelanggan'],
      idMeja: json['id_meja'],
      tglTransaksi: DateTime.parse(json['tgl_transaksi']),
      totalBayar: json['total_bayar'],
      metodeBayar: json['metode_bayar'],
      statusBayar: json['status_bayar'],
      statusPesanan: json['status_pesanan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_transaksi': idTransaksi,
      'id_admin': idAdmin,
      'id_pelanggan': idPelanggan,
      'id_meja': idMeja,
      'tgl_transaksi': tglTransaksi.toIso8601String(),
      'total_bayar': totalBayar,
      'metode_bayar': metodeBayar,
      'status_bayar': statusBayar,
      'status_pesanan': statusPesanan,
    };
  }
}

class MejaModel {
  final int idMeja;
  final int noMeja;
  final String linkQr;

  MejaModel({
    required this.idMeja,
    required this.noMeja,
    required this.linkQr,
  });

  factory MejaModel.fromJson(Map<String, dynamic> json) {
    return MejaModel(
      idMeja: json['id_meja'],
      noMeja: json['no_meja'],
      linkQr: json['link_qr'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_meja': idMeja,
      'no_meja': noMeja,
      'link_qr': linkQr,
    };
  }
}

