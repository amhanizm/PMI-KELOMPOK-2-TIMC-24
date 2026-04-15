import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:sigercep_admin/app.dart';
import 'package:sigercep_admin/features/auth/providers/auth_provider.dart';

void main() {
  testWidgets('Login screen renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: const GercepAdminApp(),
      ),
    );

    // Tunggu semua animasi dan frame selesai
    await tester.pumpAndSettle();

    // Verify that login screen shows GERCEP SIGNATURE
    expect(find.text('GERCEP SIGNATURE'), findsOneWidget);

    // Verify that input fields exist (Nama dan Password)
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Verify that MASUK button exists
    expect(find.text('MASUK'), findsOneWidget);
  });
}