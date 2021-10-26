// ignore: implementation_imports
import 'package:timeago/src/messages/lookupmessages.dart' show LookupMessages;

/// Japanese messages
class JaCustomMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '今から';
  @override
  String suffixAgo() => '前';
  @override
  String suffixFromNow() => '後';
  @override
  String lessThanOneMinute(int seconds) => '1分';
  @override
  String aboutAMinute(int minutes) => '約1分';
  @override
  String minutes(int minutes) => '$minutes分';
  @override
  String aboutAnHour(int minutes) => '約1時間';
  @override
  String hours(int hours) => '約$hours時間';
  @override
  String aDay(int hours) => '約1日';
  @override
  String days(int days) => '約$days日';
  @override
  String aboutAMonth(int days) => '約1か月';
  @override
  String months(int months) => '約$monthsか月';
  @override
  String aboutAYear(int year) => '約1年';
  @override
  String years(int years) => '約$years年';
  @override
  String wordSeparator() => '';
}

/// English short Messages
class JaCustomShortMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'now';
  @override
  String aboutAMinute(int minutes) => '1分';
  @override
  String minutes(int minutes) => '$minutes分';
  @override
  String aboutAnHour(int minutes) => '~1時間';
  @override
  String hours(int hours) => '$hours時間';
  @override
  String aDay(int hours) => '~1日';
  @override
  String days(int days) => '$days日';
  @override
  String aboutAMonth(int days) => '~1月';
  @override
  String months(int months) => '$months月';
  @override
  String aboutAYear(int year) => '~1年';
  @override
  String years(int years) => '$years年';
  @override
  String wordSeparator() => ' ';
}
