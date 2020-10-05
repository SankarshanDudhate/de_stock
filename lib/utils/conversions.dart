import 'package:intl/intl.dart';

String dateToMMMddyyyy(String dateStr) {
  //Use it when you show incoming string to user in a more readable format
  List dateParts = dateStr.split("-");
  DateTime enqDate = DateTime(int.parse(dateParts[0]),int.parse(dateParts[1]),int.parse(dateParts[2]));
  DateFormat formatter = DateFormat("MMM dd, yyyy");
  return formatter.format(enqDate);
}

String dateToyyyyMMdd(DateTime date) {
  //Use it when you wanna send current date to backend
  DateFormat formatter = DateFormat("yyyy-MM-dd");
  return formatter.format(date);
}