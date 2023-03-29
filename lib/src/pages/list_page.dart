import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  //List<int> _listNum = [1, 2, 3, 4, 5];
  List<int> _listNum = [];
  int _item = 0;

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _addImage();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_addImage();
        _fetchData();
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
          title: Text('Listas'),
        ),
        body: Stack(
          children: <Widget>[
            _createList(),
            _createLoading(),
          ],
        ));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _getPage,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNum.length,
        itemBuilder: (BuildContext context, int index) {
          final img = _listNum[index];
          String url = 'https://picsum.photos/500/300?image=$img';

          return FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(url),
          );
        },
      ),
    );
  }

  void _addImage() {
    for (var i = 1; i < 10; i++) {
      _item++;
      _listNum.add(_item);
      setState(() {});
    }
  }

  Future _fetchData() async {
    _loading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);

    return new Timer(duration, requestHTTP);
  }

  void requestHTTP() {
    _loading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );

    _addImage();
  }

  Widget _createLoading() {
    if (_loading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> _getPage() async {
    final duration = new Duration(seconds: 2);
    /*new Timer(duration, () {
      _listNum.clear();
      _item++;
      _addImage();
    });*/
    return Future.delayed(
      duration,
      () {
        _listNum.clear();
        _item++;
        _addImage();
      },
    );
  }
}
