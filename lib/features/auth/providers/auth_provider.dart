import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _currentUser;
  bool _isLoading = false;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _currentUser != null;

  AuthProvider() {
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('gercep_logged_in') ?? false;

    if (isLoggedIn) {
      final name = prefs.getString('gercep_user_name') ?? '';
      final role = prefs.getString('gercep_user_role') ?? 'Admin';
      _currentUser = UserModel(name: name, role: role);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> login(String name, String password) async {
    if (name.isEmpty || password.isEmpty) return false;

    // Simulasi login sukses (nanti bisa diganti validasi API)
    _currentUser = UserModel(name: name, role: 'Admin');

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('gercep_logged_in', true);
    await prefs.setString('gercep_user_name', name);
    await prefs.setString('gercep_user_role', 'Admin');

    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    _currentUser = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    notifyListeners();
  }
}