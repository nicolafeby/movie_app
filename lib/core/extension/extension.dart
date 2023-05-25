import 'package:intl/intl.dart';

extension DateTimeExtention on DateTime {
  String toFormattedDate() {
    final pattern = DateFormat('dd MMMM yyyy');
    return pattern.format(this);
  }
}
