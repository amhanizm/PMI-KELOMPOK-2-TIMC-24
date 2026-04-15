import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_styles.dart';
import '../../../shared/layouts/main_layout.dart';
import '../providers/menu_provider.dart';
import '../widgets/menu_card.dart';
import '../widgets/search_bar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuProvider(),
      child: const MainLayout(
        title: 'GERCEP Menu Management',
        selectedIndex: 2,
        child: MenuContent(),
      ),
    );
  }
}

class MenuContent extends StatelessWidget {
  const MenuContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                // Header dengan Search
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Menu List',
                        style: AppStyles.heading2,
                      ),
                      Consumer<MenuProvider>(
                        builder: (context, provider, _) {
                          return MenuSearchBar(
                            onSearch: provider.searchMenu,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // Grid Menu
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Consumer<MenuProvider>(
                    builder: (context, provider, _) {
                      final menus = provider.filteredMenu;
                      if (menus.isEmpty) {
                        return const Center(
                          child: Text('Tidak ada menu ditemukan'),
                        );
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 3.5,
                        ),
                        itemCount: menus.length,
                        itemBuilder: (context, index) {
                          return MenuCard(menu: menus[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}