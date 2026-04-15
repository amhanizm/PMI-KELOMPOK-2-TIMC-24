import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class PaymentTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  const PaymentTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        children: [
          _buildTab('Pembayaran Masuk', 0),
          _buildTab('Riwayat Transaksi', 1),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    final isActive = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTabChanged(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            border: isActive
                ? const Border(
                    bottom: BorderSide(
                      color: AppColors.accentYellow,
                      width: 4,
                    ),
                  )
                : null,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}