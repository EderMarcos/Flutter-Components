import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

	String _name = '';
	String _email = '';
	String _password = '';
	String _date = '';
	String _powerSelected = 'Fuerza';
	List<String> _powers = ['Fuerza', 'Volvar', 'Rayos X', 'Super Aliento'];

	TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				title: Text('Inputs de texto'),
			),
			body: ListView(
				padding: EdgeInsets.all(16.0),
				children: <Widget>[
					_createInput(),
					Divider(),
					_createEmail(),
					Divider(),
					_createPassword(),
					Divider(),
					_createDate(context),
					Divider(),
					_createDropdown()
				],
			),
		);
  }

  Widget _createInput() {
  	return TextField(
			textCapitalization: TextCapitalization.sentences,
			maxLength: 50,
			decoration: InputDecoration(
				border: OutlineInputBorder(),
				counter: Text('${ _name.length } /50'),
				hintText: 'Francisco Villa',
				labelText: 'Name',
				helperText: 'Solo escribir nombres',
				suffixIcon: Icon(Icons.accessibility),
				icon: Icon(Icons.account_circle)
			),
			onChanged: (nameData) {
				setState(() {
					_name = nameData;
				});
			},
		);
	}

  Widget _createEmail() {
  	return TextField(
			keyboardType: TextInputType.emailAddress,
			decoration: InputDecoration(
				border: OutlineInputBorder(),
				counter: Text('${ _email.length }/100'),
				labelText: 'Email',
				hintText: 'example@mtech-systems.com',
				suffixIcon: Icon(Icons.alternate_email),
				icon: Icon(Icons.email)
			),
			onChanged: (emailData) {
				setState(() {
				  _email = emailData;
				});
			},
		);
	}

  Widget _createPassword() {
  	return TextField(
			obscureText: true,
			decoration: InputDecoration(
				border: OutlineInputBorder(),
				counter: Text('${ _password.length }/100'),
				labelText: 'Password',
				hintText: 'Password',
				suffixIcon: Icon(Icons.lock_open),
				icon: Icon(Icons.lock)
			),
			onChanged: (passwordData) {
				setState(() {
					_password = passwordData;
				});
			},
		);
	}

  Widget _createDate(BuildContext context) {
  	return TextField(
			controller: _inputFieldDateController,
			enableInteractiveSelection: false,
			decoration: InputDecoration(
				border: OutlineInputBorder(),
				labelText: 'Date',
				suffixIcon: Icon(Icons.perm_contact_calendar),
				icon: Icon(Icons.calendar_today)
			),
			onTap: () {
				FocusScope.of(context).requestFocus(FocusNode());
				_selectDate(context);
			},
		);
	}

  void _selectDate(BuildContext context) async {
  	DateTime selectedDate = DateTime.now();
  	DateTime dateTime = await showDatePicker(
			context: context,
			initialDate: selectedDate,
			firstDate: DateTime(2018),
			lastDate: DateTime(2025)
		);

  	if (dateTime != null) {
  		setState(() {
  		  _date = dateTime.toString();
  		  print('${ dateTime.toLocal() }');
				_inputFieldDateController.text = '${ dateTime.toLocal() }';
  		});
		}
	}

  Widget _createDropdown() {
  	return Row(
			children: <Widget>[
				Icon(Icons.select_all),
				SizedBox(width: 16.0),
				Expanded(
					child: DropdownButton(
						value: _powerSelected,
						items: getOptionsDropdown(),
						onChanged: (option) {
							print(option);
							setState(() {
								_powerSelected = option;
							});
						},
					)
				)
			],
		);
	}

	List<DropdownMenuItem<String>> getOptionsDropdown() {
  	List<DropdownMenuItem<String>> list = new List();
  	_powers.forEach((power) {
  		list.add(DropdownMenuItem(
				child: Text(power),
				value: power,
			));
		});
		return list;
	}
}
