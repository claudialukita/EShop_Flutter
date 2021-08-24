import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.71,
            child: ListView(
              children: new List.generate(
                4,
                (i) => new ListTileItem(
                  title: "Item#$i",
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF40BFFF).withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(1, 3), // changes position of shadow
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, '/CardDetailScreen')},
              style: Theme.of(context).elevatedButtonTheme.style,
              child: Text('Next', style: Theme.of(context).textTheme.button),
            ),
          ),
        ],
      ),
    ]);
  }
}

class ListTileItem extends StatefulWidget {
  String title;
  ListTileItem({required this.title});
  @override
  _ListTileItemState createState() => new _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  int _itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: MediaQuery.of(context).size.width *
          343 /
          MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height *
          240 /
          MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFEBF0FF)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("Priscekila",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .apply(color: Color(0xFF223263))),
          ),
          SizedBox(height: 16),
          Container(
            child: RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  style: Theme.of(context).textTheme.caption,
                  text:
                      "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States"),
            ),
          ),
          SizedBox(height: 16),
          Container(
            child: Text("+99 1234567890",
                style: Theme.of(context).textTheme.caption),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 77,
                height: 57,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF40BFFF).withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(1, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () => {
                    /*Navigator.pushNamed(context, '/DeliveryDetailScreen')*/
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child:
                      Text('Edit', style: Theme.of(context).textTheme.button),
                ),
              ),
              IconButton(
                padding: EdgeInsets.symmetric(horizontal: 25),
                constraints: BoxConstraints(),
                icon: Icon(Icons.delete_outline,
                    size: 30, color: Color(0xFF9098B1)),
                onPressed: () => setState(() => _itemCount = 0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
