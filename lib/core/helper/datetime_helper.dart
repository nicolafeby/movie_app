import 'package:intl/intl.dart';

class DateHelper {
  static String toFormattedDate(String date) {
    DateTime parsedDate =
        DateFormat("yyyy-MM-ddTHH:mm:ss").parse(date, true).toLocal();
    String formattedDate =
        DateFormat('dd MMMM yyyy', 'id_ID').format(parsedDate);
    return formattedDate;
  }
}
