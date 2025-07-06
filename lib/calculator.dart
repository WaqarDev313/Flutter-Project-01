import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

// calculator screen

class _CalculatorState extends State<Calculator> {
  TextEditingController numController = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String selectedOperation = 'Add'; // Default operation
  double result = 0; // Store the calculated result

  void calculateResult() {
    double num1 = double.tryParse(numController.text) ?? 0; // Convert text to number
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    setState(() {
      if (selectedOperation == 'Add') {
        result = num1 + num2;
      } else if (selectedOperation == 'Subtract') {
        result = num1 - num2;
      } else if (selectedOperation == 'Multiply') {
        result = num1 * num2;
      } else if (selectedOperation == 'Divide') {
        result = num2 != 0 ? num1 / num2 : 0; // Avoid division by zero
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calculator', style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Color(0xFF1A237E), 
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'Result: $result',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[900],
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: numController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Value 1',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: num2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Value 2',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers),
                ),
              ),
              SizedBox(height: 20),

              // Dropdown for selecting operation
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButton<String>(
                  value: selectedOperation,
                  isExpanded: true,
                  underline: SizedBox(),
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                  items: [
                    DropdownMenuItem(value: 'Add', child: Text('Add')),
                    DropdownMenuItem(value: 'Subtract', child: Text('Subtract')),
                    DropdownMenuItem(value: 'Multiply', child: Text('Multiply')),
                    DropdownMenuItem(value: 'Divide', child: Text('Divide')),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOperation = newValue!;
                    });
                  },
                ),
              ),

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: calculateResult,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A237E),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Calculate', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
