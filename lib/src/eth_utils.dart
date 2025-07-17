// src/ethiopian_utils.dart

class EthiopianDate {
  final int year;
  final int month;
  final int day;

  EthiopianDate(this.year, this.month, this.day);

  @override
  String toString() => '$year/$month/$day';
}

// Days in each month
const List<int> ethiopianMonthLengths = [
  30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 5 // Pagumē is 5 or 6 in leap year
];

// Ethiopian months
const List<String> ethiopianMonthNames = [
  '', // index 0 is unused
  'መስከረም', 'ጥቅምት', 'ህዳር', 'ታህሳስ', 'ጥር', 'የካቲት',
  'መጋቢት', 'ሚያዝያ', 'ግንቦት', 'ሰኔ', 'ሀምሌ', 'ነሃሴ', 'ጳጉሜ'
];
