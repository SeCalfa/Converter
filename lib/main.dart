import 'package:flutter/material.dart';

void main() {
  runApp(KmToMilesConverterApp());
}

class KmToMilesConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Km to Miles Converter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: KmToMilesConverterScreen(),
    );
  }
}

class KmToMilesConverterScreen extends StatefulWidget {
  @override
  _KmToMilesConverterScreenState createState() => _KmToMilesConverterScreenState();
}

class _KmToMilesConverterScreenState extends State<KmToMilesConverterScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  double? _milesKilometers, _kilogramsPounds, _celsiusFahrenheit;
  String kilometers = 'Kilometers';
  String miles = 'Miles';
  String kilograms = 'Kilograms';
  String pounds = 'Pounds';
  String celsius = 'Celsius';
  String fahrenheit = 'Fahrenheit';
  String? result1, result2, result3;

  void _convertKtoM() {
    setState(() {
      double? km = double.tryParse(_controller1.text);
      if (km != null) {
        _milesKilometers = km * 0.621371;
        result1 = miles;
      } else {
        _milesKilometers = null;
        result1 = null;
      }
    });
  }

  void _convertMtoK() {
    setState(() {
      double? m = double.tryParse(_controller1.text);
      if (m != null) {
        _milesKilometers = m / 0.621371;
        result1 = kilometers;
      } else {
        _milesKilometers = null;
      }
    });
  }

  void _convertKGtoP() {
    setState(() {
      double? kg = double.tryParse(_controller2.text);
      if (kg != null) {
        _kilogramsPounds = kg * 2.205;
        result2 = pounds;
      } else {
        _kilogramsPounds = null;
      }
    });
  }

  void _convertPtoKG() {
    setState(() {
      double? p = double.tryParse(_controller2.text);
      if (p != null) {
        _kilogramsPounds = p / 2.205;
        result2 = kilograms;
      } else {
        _kilogramsPounds = null;
      }
    });
  }

  void _convertCtoF() {
    setState(() {
      double? c = double.tryParse(_controller3.text);
      if (c != null) {
        _celsiusFahrenheit = c * 9 / 5 + 32;
        result3 = fahrenheit;
      } else {
        _celsiusFahrenheit = null;
      }
    });
  }

  void _convertFtoC() {
    setState(() {
      double? f = double.tryParse(_controller3.text);
      if (f != null) {
        _celsiusFahrenheit = (f - 32) * 5 / 9;
        result3 = celsius;
      } else {
        _celsiusFahrenheit = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Converter'),
        centerTitle: true
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _controller1,
              decoration: InputDecoration(
                labelText: 'Kilometers or Miles',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: _convertKtoM,
                  child: Text('Kilometers to Miles'),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: _convertMtoK,
                  child: Text('Miles to Kilometers'),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (_milesKilometers != null)
              Text('${result1}: ${_milesKilometers?.toStringAsFixed(2)}'),
            
            SizedBox(height: 40),

            TextField(
              controller: _controller2,
              decoration: InputDecoration(
                labelText: 'Kilograms or Pounds',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: _convertKGtoP,
                  child: Text('Kilograms to Pounds'),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: _convertPtoKG,
                  child: Text('Pounds to Kilograms'),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (_kilogramsPounds != null)
              Text('${result2}: ${_kilogramsPounds?.toStringAsFixed(2)}'),

            SizedBox(height: 40),

            TextField(
              controller: _controller3,
              decoration: InputDecoration(
                labelText: 'Celsius or Fahrenheit',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: _convertCtoF,
                  child: Text('Celsius to Fahrenheit'),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: _convertFtoC,
                  child: Text('Fahrenheit to Celsius'),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (_celsiusFahrenheit != null)
              Text('${result3}: ${_celsiusFahrenheit?.toStringAsFixed(2)}'),

          ],
        ),
      ),
    );
  }
}