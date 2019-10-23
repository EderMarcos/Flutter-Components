import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
//				leading: Container(
//					padding: EdgeInsets.all(8.0),
//					child: CircleAvatar(
//						backgroundImage: NetworkImage('https://avatars3.githubusercontent.com/u/20048905?s=88&v=4'),
//					),
//				),
				actions: <Widget>[
					Container(
						padding: EdgeInsets.all(8.0),
						child: CircleAvatar(
							child: Text(
								'EM',
								style: TextStyle( color: Colors.white)
							),
							backgroundColor: Colors.brown
						),
					)
				],
      ),
    );
  }
}
