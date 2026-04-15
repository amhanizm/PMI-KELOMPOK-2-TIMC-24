import 'package:intl/intl.dart';

class DateFormatter {
  static String getCurrentDate() {
    final now = DateTime.now();
    return DateFormat('dd MMMM yyyy, HH:mm', 'id_ID').format(now);
  }
}