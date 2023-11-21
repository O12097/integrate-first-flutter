import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculatorPage> {
  String _num1 = '';
  String _num2 = '';
  int _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 1',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _num1 = value;
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 2',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _num2 = value;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _performOperation(Operation.Add),
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () => _performOperation(Operation.Subtract),
                  child: Text('Subtract'),
                ),
                ElevatedButton(
                  onPressed: () => _performOperation(Operation.Multiply),
                  child: Text('Multiply'),
                ),
                ElevatedButton(
                  onPressed: () => _performOperation(Operation.Divide),
                  child: Text('Divide'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _performOperation(Operation operation) {
    int num1 = int.tryParse(_num1) ?? 0;
    int num2 = int.tryParse(_num2) ?? 0;
    int result = 0;
    switch (operation) {
      case Operation.Add:
        result = num1 + num2;
        break;
      case Operation.Subtract:
        result = num1 - num2;
        break;
      case Operation.Multiply:
        result = num1 * num2;
        break;
      case Operation.Divide:
        if (num2 != 0) {
          result = num1 ~/ num2;
        } else {
          result = 0;
        }
        break;
    }
    setState(() {
      _result = result;
    });
  }
}

enum Operation { Add, Subtract, Multiply, Divide }
