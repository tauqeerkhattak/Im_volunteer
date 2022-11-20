import 'package:intl/intl.dart';

extension CustomDate on DateTime {
  String toShortString() {
    final format = DateFormat("MMM d yyyy, 'at' HH:mm");
    return format.format(this);
  }
}
