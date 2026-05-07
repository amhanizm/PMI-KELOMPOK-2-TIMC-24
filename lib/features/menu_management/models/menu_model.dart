class MenuModel {
  final int idMenu;
  final String namaMenu;
  final String kategori;
  final num hargaDasar;
  final int stok;
  final bool statusAktif;   // ← BOOLEAN, bukan String
  final String? subKategori;

  MenuModel({
    required this.idMenu,
    required this.namaMenu,
    required this.kategori,
    required this.hargaDasar,
    required this.stok,
    required this.statusAktif,
    this.subKategori,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      idMenu: json['id_menu'] ?? 0,
      namaMenu: json['nama_menu'] ?? '',
      kategori: json['kategori'] ?? '',
      hargaDasar: json['harga_dasar'] ?? 0,
      stok: json['stok'] ?? 0,
      statusAktif: json['status_aktif'] == true,   // ← FIX
      subKategori: json['sub_kategori'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_menu': idMenu,
      'nama_menu': namaMenu,
      'kategori': kategori,
      'harga_dasar': hargaDasar,
      'stok': stok,
      'status_aktif': statusAktif,
      'sub_kategori': subKategori,
    };
  }
}
