import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../providers/konfirmasi_provider.dart';
import '../../transaksi/models/transaksi_model.dart';

class StatusButton extends StatelessWidget {
  final TransaksiModel order;

  const StatusButton({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KonfirmasiProvider>(context);
    final statusColor = provider.getStatusColor(order.statusPesanan);

    return GestureDetector(
      onTap: () {
        provider.updateStatus(order.idTransaksi, "proses");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        decoration: BoxDecoration(
          color: statusColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          order.statusPesanan,
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
