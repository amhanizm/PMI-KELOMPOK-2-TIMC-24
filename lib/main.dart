import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart'; // Tambahkan import
import 'app.dart';
import 'features/auth/providers/auth_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inisialisasi locale Indonesia untuk formatting tanggal
  await initializeDateFormatting('id_ID', null);
  
  // Orientasi potrait saja (opsional, sesuai desain web)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Supabase.initialize(
  url: 'https://eczjiyvpoepnrotiutyt.supabase.co',
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVjemppeXZwb2VwbnJvdGl1dHl0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzYxMzgyNDAsImV4cCI6MjA5MTcxNDI0MH0.bKjWbTIwn22OasIho2Tw7BjKDlNFFwfyOIgOeCjVPdQ',
);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const GercepAdminApp(),
    ),
  );

  

}