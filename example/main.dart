import 'package:flutter/material.dart';
import 'package:calendar_picker/calendar_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calendar Picker Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Pick Date"),
              onPressed: () async {
                final result = await showCustomDatePicker(
                  context: context,
                  //Those firstYear and lastYear parameters set the range of year to be seen in the datepicker
                  firstYear: 2000,// Here Choose intial year to be apear in the dropdown
                  lastYear: 2030, // Here Choose last year to be apear in the dropdown
                );

                if (result != null) {
                  setState(() => selectedDate = result);
                }
              },
            ),
            const SizedBox(height: 20),
            if (selectedDate != null)
              Text("Selected: ${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}")
          ],
        ),
      ),
    );
  }
}
