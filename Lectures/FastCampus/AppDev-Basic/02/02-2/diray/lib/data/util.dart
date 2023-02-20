class Utils {
  static int getFormatTime(DateTime date) {
    return int.parse(
        "${date.year}${makeToDigit(date.month)}${makeToDigit(date.day)}");
  }

  static DateTime numberToDatetime(int date) {
    String _d = date.toString();
    int year = int.parse(_d.substring(0, 4));
    int month = int.parse(_d.substring(4, 6));
    int day = int.parse(_d.substring(6, 8));

    return DateTime(year, month, day);
  }

  static String makeToDigit(int num) {
    return num.toString().padLeft(2, "0");
  }
}
