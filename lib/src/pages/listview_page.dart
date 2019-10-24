import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

	ScrollController _scrollController = new ScrollController();
	List<int> _numberList = [];
	int _lastIndex = 0;
	bool _isLoading = false;

	@override
  void initState() {
    super.initState();
    _initImages();

    _scrollController.addListener(() {
    	if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
    		_loadImages();
			}
		});
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				title: Text('List View Page'),
			),
			body: Stack(
				children: <Widget>[
					_createList(),
					_createLoading()
				],
			),
		);
  }

  Widget _createList() {
  	return RefreshIndicator(
			onRefresh: getPage,
			child: ListView.builder(
				controller: _scrollController,
				itemCount: _numberList.length,
				itemBuilder: (BuildContext context, int index) {
					return FadeInImage(
						image: NetworkImage(
							'https://picsum.photos/500/300?image=${ _numberList[index] }'),
						fit: BoxFit.cover,
						height: 300.0,
						placeholder: AssetImage('assets/loader.gif'),
					);
				},
			),
		);
	}

	Future<Null> getPage() async {
		Duration duration = Duration(seconds: 2);
		new Timer(duration, () {
			_numberList.clear();
			_lastIndex++;
			_initImages();
		});
		return Future.delayed(duration);
	}

	void _initImages() {
		setState(() {
			for (var i = 0; i < 10; i++) {
				_lastIndex++;
				_numberList.add(_lastIndex);
			}
		});
	}

	void _loadImages() async {
		_isLoading = true;
		setState(() { });

		new Timer(Duration(seconds: 2), () {
			_isLoading = false;

			// Animacion para dar a entender que hay mas informacion
			_scrollController.animateTo(
				_scrollController.position.pixels + 50,
				duration: Duration(milliseconds: 250),
				curve: Curves.fastOutSlowIn
			);

			_initImages();
		});
	}

  Widget _createLoading() {
		if (_isLoading) {
			return Container(
				padding: EdgeInsets.all(16.0),
				child: Column(
					mainAxisSize: MainAxisSize.max,
					mainAxisAlignment: MainAxisAlignment.end,
					children: <Widget>[
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								CircularProgressIndicator()
							],
						)
					],
				),
			);
		} else {
			return Container();
		}
	}
}
