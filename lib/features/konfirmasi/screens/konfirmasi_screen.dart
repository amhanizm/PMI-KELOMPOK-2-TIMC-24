import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/layouts/main_layout.dart';
import '../providers/konfirmasi_provider.dart';

class KonfirmasiScreen extends StatelessWidget {
  const KonfirmasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => KonfirmasiProvider()..fetchPesanan(),
      child: const MainLayout(
        title: 'Konfirmasi Pesanan',
        selectedIndex: 1,
        child: KonfirmasiContent(),
      ),
    );
  }
}

class KonfirmasiContent extends StatelessWidget {
  const KonfirmasiContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KonfirmasiProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final pesanan = provider.pesananMasuk;

        if (pesanan.isEmpty) {
          return const Center(
            child: Text(
              "Tidak ada pesanan pending",
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: pesanan.length,
          itemBuilder: (context, index) {
            final trx = pesanan[index];

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
                    provider.updateStatus(trx.idTransaksi, "proses");
                  },
                  child: const Text("Konfirmasi"),
                ),
                onTap: () async {
                  final detail = await provider.getDetail(trx.idTransaksi);

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Detail Pesanan"),
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
