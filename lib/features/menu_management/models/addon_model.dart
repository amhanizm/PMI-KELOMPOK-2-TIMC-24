class AddOnModel {
  final int idAddOn;
  final String namaAddOn;
  final int stok;
  final num hargaTambahan;
  final String statusAktif;

  AddOnModel({
    required this.idAddOn,
    required this.namaAddOn,
    required this.stok,
    required this.hargaTambahan,
    required this.statusAktif,
  });

  factory AddOnModel.fromJson(Map<String, dynamic> json) {
    return AddOnModel(
      idAddOn: json['id_adds_on'],
      namaAddOn: json['nama_adds_on'],
      stok: json['stok'],
      hargaTambahan: json['harga_tambahan'],
      statusAktif: json['status_aktif'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_adds_on': idAddOn,
      'nama_adds_on': namaAddOn,
      'stok': stok,
      'harga_tambahan': hargaTambahan,
      'status_aktif': statusAktif,
    };
  }
}
