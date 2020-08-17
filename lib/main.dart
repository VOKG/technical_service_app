import 'package:flutter/material.dart';
import 'package:technical_service_app/UI/BottomTabbarExample.dart';

import 'UI/DrawerWidget.dart';
import 'UI/ExpansionPanelWidget.dart';


void main() => runApp(App0701());

class App0701 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrawerWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const _youAre = 'You are';
const _compatible = 'compatible with\nDoris D. Developer.';

class _MyHomePageState extends State<MyHomePage> {
  double _loveFlutterSliderValue = 1.0;
  String _messageToUser = "";
  bool _ageSwitchValue = false;
  bool _genderValue = false;


  /// State
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Are you compatible with Doris?"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            //_buildLoveFlutterSlider(),
            //_buildResultArea(),
            ExpansionPanelWidget()

          ],
        ),
      ),
    );
  }
  Widget _buildLoveFlutterSlider() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text("On a scale of 1 to 10, "
            "how much do you love developing Flutter apps?"),
        Slider(
          min: 1.0,
          max: 10.0,
          divisions: 9,
          value: _loveFlutterSliderValue,
          onChanged: _updateLoveFlutterSlider,
          label: '${_loveFlutterSliderValue.toInt()}',
        ),
      ],
    );
  }

  Widget _buildResultArea() {
    return Row(
      children: <Widget>[
        RaisedButton(
          child: Text("Submit"),
          onPressed: _updateResults,
        ),
        SizedBox(
          width: 15.0,
        ),
        Text(_messageToUser, textAlign: TextAlign.center),
      ],
    );
  }

  /// Actions

  void _updateLoveFlutterSlider(double newValue) {
    setState(() {
      _loveFlutterSliderValue = newValue;
    });
  }

  void _updateResults() {
    setState(() {
      _messageToUser = _youAre +
          (_loveFlutterSliderValue >= 8 ? " " : " NOT ") +
          _compatible;
    });
  }
}



