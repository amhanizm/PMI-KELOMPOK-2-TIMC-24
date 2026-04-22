import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../providers/pembayaran_provider.dart';
import '../../transaksi/models/transaksi_model.dart';

class PaymentTable extends StatelessWidget {
  final List<TransaksiModel> data;

  const PaymentTable({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PembayaranProvider>(context);

    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(1.5),
        3: FlexColumnWidth(2),
      },
      children: [
        _buildHeader(),
        ...data.map((trx) => _buildRow(trx, provider)),
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
      _headerCell('Meja'),
      _headerCell('Total'),
      _headerCell('Metode'),
      _headerCell('Status Pembayaran', center: true),
    ],
  );
}


  static Widget _headerCell(String text, {bool center = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primaryBlue,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        textAlign: center ? TextAlign.center : TextAlign.left,
      ),
    );
  }

  TableRow _buildRow(TransaksiModel trx, PembayaranProvider provider) {
    final statusColor = trx.statusBayar == 'pending'
        ? Colors.orange
        : Colors.green;

    return TableRow(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      children: [
        _dataCell("Meja ${trx.idMeja}"),
        _dataCell("Rp ${trx.totalBayar}", color: AppColors.primaryBlue),
        _dataCell(trx.metodeBayar ?? "-", color: AppColors.primaryBlue),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Center(
            child: GestureDetector(
              onTap: () {
                provider.konfirmasiPembayaran(trx.idTransaksi);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  trx.statusBayar,
                  style: const TextStyle(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _dataCell(String text, {Color? color}) {
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
