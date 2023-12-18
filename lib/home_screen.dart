import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

  const _youAre = 'You are';
  const _compatible = 'compatible with\n Dorris D. Developer';

class _HomeScreenState extends State<HomeScreen> {

  bool _ageSwitchValue = false;
  String _messageToUser = "$_youAre NOT $_compatible";
  double _loveFlutterSliderValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dorris Dating app'),
      ),
      body: Padding(padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text("on a scale of 1 to 10, "
          "how much do you love developing flutter apps"),
          Slider(value: _loveFlutterSliderValue, onChanged: _updateLoveFlutterSlider, min: 1.0, max: 10.0, divisions: 9, label: '${_loveFlutterSliderValue.toInt()}',),
          _buildAgeSwith(),
          _buildResultArea(),
        ],
      ),),
    );
  }

  void _updateLoveFlutterSlider(double newVal) {
    setState(() {
      _loveFlutterSliderValue = newVal;
    });
  }

  Widget _buildAgeSwith(){
  return Row(
    children: [
      Text('Are  you 18 or older ?'),
      Switch(value: _ageSwitchValue, onChanged: _updateAgeSwitch)
    ],
  );
}

  Widget _buildResultArea() {
    return Row(
      children: [
        MaterialButton(onPressed: _updateResults, child: Text("Submit"),),
        SizedBox(width: 15,),
        Text(_messageToUser, textAlign: TextAlign.center,),
      ],
    );
  }

  void _updateAgeSwitch(bool newVal) {
    setState(() {
      _ageSwitchValue = newVal;
    });
  }

  void _updateResults() {
    setState(() {
      _messageToUser = _youAre + (_ageSwitchValue ? " " : " Not ") + _compatible;
    });
  }
}


