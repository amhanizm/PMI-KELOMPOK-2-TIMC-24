import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../providers/pembayaran_provider.dart';
import '../models/payment_model.dart';

class PaymentTable extends StatelessWidget {
  final List<PaymentModel> data;

  const PaymentTable({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PembayaranProvider>(context);

    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(1.5),
        3: FlexColumnWidth(1.5),
        4: FlexColumnWidth(2),
      },
      children: [
        _buildHeader(),
        ...data.map((payment) => _buildRow(payment, provider)),
      ],
    );
  }

  TableRow _buildHeader() {
    return TableRow(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 2),
        ),
      ),
      children: [
        _buildHeaderCell('Meja'),
        _buildHeaderCell('Pesanan'),
        _buildHeaderCell('Add-ons'),
        _buildHeaderCell('Harga'),
        _buildHeaderCell('Status Pembayaran', center: true),
      ],
    );
  }

  Widget _buildHeaderCell(String text, {bool center = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.primaryBlue,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        textAlign: center ? TextAlign.center : TextAlign.left,
      ),
    );
  }

  TableRow _buildRow(PaymentModel payment, PembayaranProvider provider) {
    final statusColor = provider.getStatusColor(payment.status);

    return TableRow(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      children: [
        _buildDataCell(payment.meja),
        _buildDataCell(payment.pesanan, color: AppColors.primaryBlue),
        _buildDataCell(payment.addons, color: AppColors.primaryBlue),
        _buildDataCell(payment.formattedHarga, color: AppColors.primaryBlue),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                payment.status,
                style: const TextStyle(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDataCell(String text, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(
        text,
        style: TextStyle(
          color: color ?? Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}