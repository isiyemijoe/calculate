import 'package:intl/intl.dart';

extension dateExt on DateTime{
  toFormattedDate(){
    return DateFormat('yyyy-MM-dd').format(this);
  }
}