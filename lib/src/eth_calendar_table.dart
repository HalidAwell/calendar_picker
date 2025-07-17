// src/ethiopian_calendar_table.dart
import 'package:flutter/material.dart';
import 'eth_utils.dart';

class CalendarTableEthiopian extends StatelessWidget {
  final EthiopianDate selectedDate;
  final Function(EthiopianDate) onDateSelected;

  const CalendarTableEthiopian({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Simplified display: just render 30-day grid (expand logic later)
    final daysInMonth = ethiopianMonthLengths[selectedDate.month - 1];

    return GridView.builder(
      shrinkWrap: true,
      itemCount: daysInMonth,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
      itemBuilder: (context, index) {
        final day = index + 1;
        return GestureDetector(
          onTap: () => onDateSelected(
            EthiopianDate(selectedDate.year, selectedDate.month, day),
          ),
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: selectedDate.day == day ? Colors.green : null,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: Text('$day'),
          ),
        );
      },
    );
  }
}
