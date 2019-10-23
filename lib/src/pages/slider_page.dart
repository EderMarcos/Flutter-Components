import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

	double _sliderValue = 50.0;
	bool _isCheckboxActive = false;
	bool _isSwitchActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				title: Text('Slider Page'),
			),
			body: Container(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						_createSlider(),
						_createCheckbox(),
						_createSwitch(),
						_createImage()
					],
				),
			),
		);
  }

  Widget _createSlider() {
  	return Slider(
			activeColor: Colors.indigo,
			value: _sliderValue,
			min: 10.0,
			max: 200.0,
			onChanged: !_isCheckboxActive ? (value) {
				print(value);
				setState(() {
					_sliderValue = value;
				});
			} : null
		);
	}

  Widget _createImage() {
  	return Expanded(
			child: Image(
				image: NetworkImage('https://p7.hiclipart.com/preview/389/189/270/marvel-super-hero-squad-online-captain-america-carol-danvers-thor-captain-america.jpg'),
				width: _sliderValue,
				fit: BoxFit.contain,
			),
		);
	}

  Widget _createCheckbox() {
  	return CheckboxListTile(
			title: Text('Bloquear Slider'),
			value: _isCheckboxActive,
			onChanged: (value) {
				setState(() {
				  _isCheckboxActive = value;
				});
			}
		);
	}

  Widget _createSwitch() {
  	return SwitchListTile(
			title: Text('Notifications'),
			value: _isSwitchActive,
			onChanged: (value) {
				setState(() {
					_isSwitchActive = value;
				});
			}
		);
	}
}
