import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  if (DateFormat('HH:mm').format(dateTime) == DateFormat(' HH:mm').format(DateTime.now())) {
    return 'Today ${DateFormat('HH:mm').format(dateTime)}';
  } else {
    return DateFormat('HH:mm').format(dateTime);
  }
}
