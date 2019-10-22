import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.initData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) => ListView(children: _listItems(snapshot.data, context)),
    );
  }

  // Function
  //  Se recbe el json para convertirlo en lista
  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];
    data.forEach((opt) {
      options..add(
          ListTile(
            title: Text(opt['text']),
            leading: Icon(IconData(opt['code'], fontFamily: 'MaterialIcons'), color: Colors.blue),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pushNamed(context, opt['route']);
            },
          )
      )..add(Divider());
    });
    return options;
  }
}
