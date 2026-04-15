class UserModel {
  final String name;
  final String role;

  UserModel({
    required this.name,
    this.role = 'Admin',
  });
}