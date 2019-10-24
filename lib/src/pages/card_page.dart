import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
        	_card1(),
					SizedBox(height: 16),
					_card2(),
					SizedBox(height: 16),
					_card1(),
					SizedBox(height: 16),
					_card2(),
					SizedBox(height: 16),
					_card1(),
					SizedBox(height: 16),
					_card2(),
					SizedBox(height: 16),
					_card1(),
					SizedBox(height: 16),
					_card2()
				],
      ),
    );
  }

  Widget _card1() {
    return Card(
			elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: <Widget>[
          ListTile(
              leading: Icon(
                Icons.photo_album,
                color: Colors.blue,
              ),
              title: Text('Titulo de la targeta'),
              subtitle: Text(
                  'Lorem ipsum dolor sit amet consectetur adipiscing elit sed pretium tortor leo, natoque maecenas fermentum ad dis magna eget condimentum')),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _card2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://images.unsplash.com/13/unsplash_523b1f5aafc42_1.JPG?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1354&q=80'),
            placeholder: AssetImage('assets/loader.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.cover,
          ),
          Container(
						padding: EdgeInsets.all(16),
						child: Text(
							'No tengo idea',
							style: TextStyle(
								fontSize: 16
							),
						)
					)
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
				borderRadius: BorderRadius.circular(8.0),
				color: Colors.white,
				boxShadow: <BoxShadow> [
					BoxShadow(
						color: Colors.black26,
						blurRadius: 8.0,
						spreadRadius: 2.0,
						offset: Offset(2.0, 10.0)
					)
				]
			),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: card,
      ),
    );
  }
}
