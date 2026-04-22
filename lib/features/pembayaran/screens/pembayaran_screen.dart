import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/layouts/main_layout.dart';
import '../providers/pembayaran_provider.dart';

class PembayaranScreen extends StatelessWidget {
  const PembayaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PembayaranProvider()..fetchPembayaran(),
      child: const MainLayout(
        title: 'Konfirmasi Pembayaran',
        selectedIndex: 3,
        child: PembayaranContent(),
      ),
    );
  }
}

class PembayaranContent extends StatelessWidget {
  const PembayaranContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PembayaranProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final list = provider.pembayaranPending;

        if (list.isEmpty) {
          return const Center(
            child: Text("Tidak ada pembayaran pending"),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: list.length,
          itemBuilder: (context, index) {
            final trx = list[index];

            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 3,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(
                  "Meja ${trx.idMeja}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Total Bayar: Rp ${trx.totalBayar}",
                  style: const TextStyle(fontSize: 14),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    provider.konfirmasiPembayaran(trx.idTransaksi);
                  },
                  child: const Text("Konfirmasi"),
                ),
                onTap: () async {
                  final detail = await provider.getDetail(trx.idTransaksi);

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Detail Pembayaran"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: detail.map((d) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Menu ID ${d.idMenu} x${d.jumlah} = Rp ${d.subtotal}",
                            ),
                          );
                        }).toList(),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Tutup"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
