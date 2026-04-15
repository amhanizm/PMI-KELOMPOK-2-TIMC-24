import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class AnalyticsModal extends StatelessWidget {
  const AnalyticsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        padding: const EdgeInsets.all(30),
        constraints: const BoxConstraints(maxWidth: 900),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Detail Analistik Pendapatan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 25),
            // Grid 3 kolom (baris pertama)
            Row(
              children: [
                Expanded(
                  child: _buildMiniCard(
                    title: 'Jumlah Pesanan Hari ini',
                    value: '5',
                    color: Colors.grey.shade400,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildMiniCard(
                    title: 'Jumlah Pesanan Kemarin',
                    value: '2',
                    color: AppColors.accentYellow,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildMiniCard(
                    title: 'Pertumbuhan Pendapatan',
                    value: '+167,5%',
                    color: const Color(0xFFA1E887),
                    trailing: const Icon(Icons.arrow_upward, size: 40, color: Colors.green),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Baris kedua (dua card besar)
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _buildLargeCard(
                    title: 'Total Pendapatan hari ini',
                    value: 'Rp 107,000',
                    color: Colors.grey.shade400,
                    showGraph: true,
                    graphColor: Colors.green,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 3,
                  child: _buildLargeCard(
                    title: 'Total Pendapatan Kemarin',
                    value: 'Rp 40,000',
                    color: Colors.grey.shade400,
                    showGraph: true,
                    graphColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniCard({
    required String title,
    required String value,
    required Color color,
    Widget? trailing,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLargeCard({
    required String title,
    required String value,
    required Color color,
    required bool showGraph,
    Color graphColor = Colors.green,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (showGraph)
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    color: graphColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: CustomPaint(
                    painter: _GraphPainter(graphColor),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// Simple graph painter (simulasi)
class _GraphPainter extends CustomPainter {
  final Color color;

  _GraphPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.lineTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.4, size.height * 0.8);
    path.lineTo(size.width * 0.6, size.height * 0.3);
    path.lineTo(size.width * 0.8, size.height * 0.6);
    path.lineTo(size.width, size.height * 0.2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}