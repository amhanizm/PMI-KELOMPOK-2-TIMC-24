class MenuModel {
  final int idMenu;
  final String namaMenu;
  final String kategori;
  final num hargaDasar;
  final int stok;
  final String statusAktif;

  MenuModel({
    required this.idMenu,
    required this.namaMenu,
    required this.kategori,
    required this.hargaDasar,
    required this.stok,
    required this.statusAktif,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      idMenu: json['id_menu'],
      namaMenu: json['nama_menu'],
      kategori: json['kategori'],
      hargaDasar: json['harga_dasar'],
      stok: json['stok'],
      statusAktif: json['status_aktif'],
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
    };
  }
}
