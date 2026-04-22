import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_styles.dart';
import '../providers/konfirmasi_provider.dart';
import 'status_button.dart';
import '../../transaksi/models/transaksi_model.dart';

class OrderTable extends StatelessWidget {
  const OrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KonfirmasiProvider>(context);
    final orders = provider.pesananMasuk; // TransaksiModel list

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Pesanan Masuk',
              style: AppStyles.heading2,
            ),
          ),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(1.5),
              3: FlexColumnWidth(1.5),
              4: FlexColumnWidth(2),
            },
            children: [
              _buildHeader(),
              ...orders.map((order) => _buildRow(context, order)),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _buildHeader() {
    return TableRow(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      children: [
        _buildHeaderCell('Meja'),
        _buildHeaderCell('Total'),
        _buildHeaderCell('Status'),
        _buildHeaderCell('Aksi', center: true),
      ],
    );
  }

  Widget _buildHeaderCell(String text, {bool center = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.primaryBlue,
          fontWeight: FontWeight.bold,
        ),
        textAlign: center ? TextAlign.center : TextAlign.left,
      ),
    );
  }

  TableRow _buildRow(BuildContext context, TransaksiModel order) {
    return TableRow(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      children: [
        _buildDataCell("Meja ${order.idMeja}", bold: true),
        _buildDataCell("Rp ${order.totalBayar}"),
        _buildDataCell(order.statusPesanan, color: AppColors.primaryBlue),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Center(
            child: StatusButton(order: order),
          ),
        ),
      ],
    );
  }

  Widget _buildDataCell(String text, {bool bold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: color ?? Colors.black,
        ),
      ),
    );
  }
}
