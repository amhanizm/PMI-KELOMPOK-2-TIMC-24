import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class MenuSearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const MenuSearchBar({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.primaryBlue),
      ),
      width: 300,
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.primaryBlue),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: onSearch,
              decoration: const InputDecoration(
                hintText: 'Search Menu',
                hintStyle: TextStyle(fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}