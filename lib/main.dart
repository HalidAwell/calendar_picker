import 'package:flutter/material.dart';
import './src/date_picker_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gregorian Date Picker',
      theme: ThemeData(primarySwatch: Colors.green),
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
      appBar: AppBar(title: const Text('Gregorian Date Picker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                DateTime initial = selectedDate ?? DateTime.now();
                final result = await showCustomDatePicker(
                  context: context,
                  firstYear: 2000,
                  lastYear: 2030,
                );

                if (result != null) {
                  setState(() => selectedDate = result);
                }
              },
              child: const Text("Pick Date"),
            ),
            const SizedBox(height: 20),
            if (selectedDate != null)
              Text(
                "Selected: ${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}",
                style: const TextStyle(fontSize: 16),
              )
          ],
        ),
      ),
    );
  }
}
