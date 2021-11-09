 import 'package:intl/intl.dart';

String getDateTime(int data) {
    return DateFormat('yyyy-MM-dd – kk:mm')
        .format(DateTime.fromMillisecondsSinceEpoch((data) * 1000));
  }

  String getDate(int data) {
    return DateFormat('dd-MM-yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch((data) * 1000));
  }

  String getDay(int data) {
    return DateFormat('EEEE')
        .format(DateTime.fromMillisecondsSinceEpoch((data) * 1000));
  }

  String getTime(int data) {
    return DateFormat('kk:mm')
        .format(DateTime.fromMillisecondsSinceEpoch((data) * 1000));
  }