import 'package:flutter/material.dart';
import 'package:sigercep_admin/core/services/supabase_service.dart';
import '../models/menu_model.dart';

class MenuProvider extends ChangeNotifier {
  List<MenuModel> menus = [];          // Data asli dari Supabase
  List<MenuModel> filteredMenu = [];   // Data hasil pencarian
  bool isLoading = false;

  // Ambil data dari Supabase
  Future<void> fetchMenus() async {
    isLoading = true;
    notifyListeners();

    final data = await SupabaseService.getData('menu');

    menus = data.map((e) => MenuModel.fromJson(e)).toList();
    filteredMenu = menus; // awalnya tampilkan semua menu

    isLoading = false;
    notifyListeners();
  }

  // Fungsi pencarian
  void searchMenu(String query) {
    if (query.isEmpty) {
      filteredMenu = menus;
    } else {
      filteredMenu = menus
          .where((menu) =>
              menu.namaMenu.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  // Update status menu (aktif / nonaktif)
  Future<void> updateStatus(int idMenu, String status) async {
    await SupabaseService.update(
      'menu',
      'id_menu',
      idMenu,
      {'status_aktif': status},
    );

    await fetchMenus(); // refresh data
  }
}
