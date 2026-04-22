class DetailTransaksiModel {
  final int idDetail;
  final int idTransaksi;
  final int idMenu;
  final int idAddOn;
  final int jumlah;
  final num hargaSnapshot;
  final num subtotal;

  DetailTransaksiModel({
    required this.idDetail,
    required this.idTransaksi,
    required this.idMenu,
    required this.idAddOn,
    required this.jumlah,
    required this.hargaSnapshot,
    required this.subtotal,
  });

  factory DetailTransaksiModel.fromJson(Map<String, dynamic> json) {
    return DetailTransaksiModel(
      idDetail: json['id_detail'],
      idTransaksi: json['id_transaksi'],
      idMenu: json['id_menu'],
      idAddOn: json['id_adds_on'],
      jumlah: json['jumlah'],
      hargaSnapshot: json['harga_snapshot'],
      subtotal: json['subtotal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_detail': idDetail,
      'id_transaksi': idTransaksi,
      'id_menu': idMenu,
      'id_adds_on': idAddOn,
      'jumlah': jumlah,
      'harga_snapshot': hargaSnapshot,
      'subtotal': subtotal,
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

class PelangganModel {
  final int idPelanggan;
  final String namaPelanggan;

  PelangganModel({
    required this.idPelanggan,
    required this.namaPelanggan,
  });

  factory PelangganModel.fromJson(Map<String, dynamic> json) {
    return PelangganModel(
      idPelanggan: json['id_pelanggan'],
      namaPelanggan: json['nama_pelanggan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_pelanggan': idPelanggan,
      'nama_pelanggan': namaPelanggan,
    };
  }
}
