import 'package:flutter/material.dart';
import '../models/menu_item_model.dart';

class MenuProvider with ChangeNotifier {
  List<MenuItemModel> _allMenu = [];
  List<MenuItemModel> _filteredMenu = [];
  String _searchQuery = '';

  List<MenuItemModel> get filteredMenu => _filteredMenu;

  MenuProvider() {
    _loadDummyData();
  }

  void _loadDummyData() {
    _allMenu = [
      MenuItemModel(
        id: '1',
        name: 'Aren Latte',
        description: 'Campuran espresso, susu segar, dan sirup gula aren.',
        icon: Icons.coffee,
      ),
      MenuItemModel(
        id: '2',
        name: 'Chicken katsu Signature',
        description: 'BBQ/BLACKPEPPER',
        icon: Icons.lunch_dining,
      ),
      MenuItemModel(
        id: '3',
        name: 'Nasi Goreng Chicken Katsu',
        description: 'Nasi goreng disajikan dengan Ayam Katsu yang renyah',
        icon: Icons.restaurant,
      ),
      MenuItemModel(
        id: '4',
        name: 'Mix Platter',
        description: 'Campuran nugget, Onion rings, dan Kentang goreng yang renyah',
        icon: Icons.fastfood,
      ),
      MenuItemModel(
        id: '5',
        name: 'French Fries',
        description: 'Kentang Goreng berbumbu yang disajikan renyah dan panas.',
        icon: Icons.restaurant_menu,
        iconColor: const Color(0xFFFCE76C),
      ),
      MenuItemModel(
        id: '6',
        name: 'Creamy Latte',
        description: '..........',
        icon: Icons.coffee,
      ),
      MenuItemModel(
        id: '7',
        name: 'Spanish Latte',
        description: 'Campuran espresso, susu segar, dan sirup gula aren.',
        icon: Icons.local_cafe,
      ),
    ];
    _applyFilter();
  }

  void toggleMenuActive(String id) {
    final index = _allMenu.indexWhere((item) => item.id == id);
    if (index != -1) {
      _allMenu[index].isActive = !_allMenu[index].isActive;
      _applyFilter();
      notifyListeners();
    }
  }

  void searchMenu(String query) {
    _searchQuery = query.toLowerCase();
    _applyFilter();
    notifyListeners();
  }

  void _applyFilter() {
    if (_searchQuery.isEmpty) {
      _filteredMenu = List.from(_allMenu);
    } else {
      _filteredMenu = _allMenu.where((item) {
        return item.name.toLowerCase().contains(_searchQuery);
      }).toList();
    }
  }
}