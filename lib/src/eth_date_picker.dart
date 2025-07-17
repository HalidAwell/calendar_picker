// src/ethiopian_date_picker_dialog.dart
import 'package:flutter/material.dart';
import 'eth_utils.dart';
import 'eth_calendar_table.dart';

Future<EthiopianDate?> showEthiopianDatePicker({
  required BuildContext context,
  required EthiopianDate initialDate,
}) {
  return showDialog<EthiopianDate>(
    context: context,
    builder: (context) {
      EthiopianDate tempSelected = initialDate;

      return AlertDialog(
        title: const Text('Select Ethiopian Date'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${ethiopianMonthNames[tempSelected.month]} ${tempSelected.year}'),
            CalendarTableEthiopian(
              selectedDate: tempSelected,
              onDateSelected: (date) {
                tempSelected = date;
                Navigator.of(context).pop(tempSelected);
              },
            ),
          ],
        ),
      );
    },
  );
}
