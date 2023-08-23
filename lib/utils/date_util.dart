import 'package:intl/intl.dart';

class DateUtil {
  static String getStringViewDate(DateTime date) {
    String newDate = DateFormat("dd MMM yyyy").format(date);
    return newDate;
  }

  static DateTime getDateTimeDate(String date) {
    DateTime newDate = DateFormat("dd MMM yyyy").parse(date);
    return newDate;
  }

  static String getStringFormalDate(DateTime date) {
    String newDate = DateFormat("dd-MM-yyyy").format(date);
    return newDate;
  }
}
