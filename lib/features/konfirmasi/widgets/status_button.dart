import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../providers/konfirmasi_provider.dart';
import '../models/order_model.dart';

class StatusButton extends StatelessWidget {
  final OrderModel order;

  const StatusButton({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KonfirmasiProvider>(context);
    final statusColor = provider.getStatusColor(order.status);

    return GestureDetector(
      onTap: () => provider.nextStatus(order),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        decoration: BoxDecoration(
          color: statusColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          order.status,
          style: const TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}