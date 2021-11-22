
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeAgo;

String timeAgoMemory(DateTime postDataTime){
  final currentLocale=Intl.getCurrentLocale();
  final now=DateTime.now();
  final difference=now.difference(postDataTime);
  return  timeAgo.format(now.subtract(difference),locale: currentLocale);
}