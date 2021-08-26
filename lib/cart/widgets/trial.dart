
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: new ListView(
          children: new List.generate(
            1,
                (i) => new ListTileItem(
              title: "Item#$i", name: "nama"
            ),
          ),
        ),
      ),
    );
  }
}

class ListTileItem extends StatefulWidget {
  String title;
  var name;
  ListTileItem({required this.title, this.name});
  @override
  _ListTileItemState createState() => new _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: new Text(widget.title),
      trailing: FittedBox(
        fit: BoxFit.cover,
        child: Row(
          children: <Widget>[
            Container(
              height: 30,
              padding: EdgeInsets.all(0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              width: 30,
              child: _itemCount != 0
                  ? IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(Icons.remove),
                onPressed: () => setState(() => _itemCount--),
              )
                  : Icon(Icons.remove),
            ),
            Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Text(_itemCount.toString(),
                  style: Theme.of(context).textTheme.subtitle2),
            ),
            Container(
              height: 30,
              width: 30,
              padding: EdgeInsets.all(0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.add),
                  onPressed: () => setState(() => _itemCount++)),
            ),
          ],
        ),
      ),
    );
  }
}
