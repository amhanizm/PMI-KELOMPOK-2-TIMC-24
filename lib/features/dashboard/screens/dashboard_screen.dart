import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_styles.dart';
import '../../../shared/layouts/main_layout.dart';
import '../../auth/providers/auth_provider.dart';
import '../widgets/analytics_modal.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return MainLayout(
      title: 'GERCEP Dashboard',
      selectedIndex: 0,
      child: SingleChildScrollView(
        padding: AppStyles.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Cards
            Row(
              children: [
                Expanded(
                  child: _buildStatsCard(
                    title: 'Total Pendapatan hari ini',
                    value: 'Rp 107,000',
                    icon: Icons.arrow_upward,
                    iconBgColor: const Color(0xFFD4EDDA),
                    iconColor: const Color(0xFF28A745),
                    onTap: () => _showAnalyticsModal(context),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildStatsCard(
                    title: 'Jumlah Pesanan Hari ini',
                    value: '5',
                    icon: Icons.list_alt,
                    iconBgColor: const Color(0xFFFFF3CD),
                    iconColor: const Color(0xFFFFC107),
                    onTap: () => _showAnalyticsModal(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Tabel Pesanan Langsung
            Container(
              padding: AppStyles.cardPadding,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pesanan Langsung',
                    style: AppStyles.heading2,
                  ),
                  const SizedBox(height: 20),
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(1.5),
                      3: FlexColumnWidth(1.5),
                      4: FlexColumnWidth(1.5),
                    },
                    children: [
                      _buildTableHeader(),
                      _buildTableRow(
                        meja: '03',
                        pesanan: 'Aren Latte',
                        addons: 'Pure matcha',
                        harga: 'Rp 27,000',
                        status: 'Dibuat',
                        statusColor: const Color(0xFFFFF3CD),
                        statusTextColor: const Color(0xFF856404),
                      ),
                      _buildTableRow(
                        meja: '03',
                        pesanan: 'Aren Latte',
                        addons: '-',
                        harga: 'Rp 20,000',
                        status: 'Disajikan',
                        statusColor: const Color(0xFFD4EDDA),
                        statusTextColor: const Color(0xFF155724),
                      ),
                      _buildTableRow(
                        meja: '03',
                        pesanan: 'Aren Latte',
                        addons: '-',
                        harga: 'Rp 20,000',
                        status: 'Disajikan',
                        statusColor: const Color(0xFFD4EDDA),
                        statusTextColor: const Color(0xFF155724),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAnalyticsModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AnalyticsModal();
      },
    );
  }

  Widget _buildStatsCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppStyles.cardPadding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.caption.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: AppStyles.heading1.copyWith(fontSize: 24),
                ),
              ],
            ),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 2,
          ),
        ),
      ),
      children: [
        _buildHeaderCell('Meja'),
        _buildHeaderCell('Pesanan'),
        _buildHeaderCell('Add-ons'),
        _buildHeaderCell('Harga'),
        _buildHeaderCell('Status Pesanan'),
      ],
    );
  }

  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primaryBlue,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  TableRow _buildTableRow({
    required String meja,
    required String pesanan,
    required String addons,
    required String harga,
    required String status,
    required Color statusColor,
    required Color statusTextColor,
  }) {
    return TableRow(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      children: [
        _buildDataCell(meja),
        _buildDataCell(pesanan, color: AppColors.primaryBlue),
        _buildDataCell(addons, color: AppColors.primaryBlue),
        _buildDataCell(harga, color: AppColors.primaryBlue),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDataCell(String text, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Text(
        text,
        style: TextStyle(
          color: color ?? AppColors.textDark,
          fontSize: 14,
        ),
      ),
    );
  }
}