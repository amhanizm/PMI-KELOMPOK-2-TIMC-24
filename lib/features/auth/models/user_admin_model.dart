class UserAdminModel {
  final int idAdmin;
  final String username;
  final String password;
  final String role;
  final String namaKasir;

  UserAdminModel({
    required this.idAdmin,
    required this.username,
    required this.password,
    required this.role,
    required this.namaKasir,
  });

  factory UserAdminModel.fromJson(Map<String, dynamic> json) {
    return UserAdminModel(
      idAdmin: json['id_admin'],
      username: json['username'],
      password: json['password'],
      role: json['role'],
      namaKasir: json['nama_kasir'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_admin': idAdmin,
      'username': username,
      'password': password,
      'role': role,
      'nama_kasir': namaKasir,
    };
  }
}
