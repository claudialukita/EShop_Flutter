import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.403,
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
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width *
                380 /
                MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height *
                164 /
                MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFEBF0FF)),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Items(3)",
                        style: Theme.of(context).textTheme.caption),
                    Text("\$598.86",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .apply(color: Color(0xFF223263))),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shipping",
                        style: Theme.of(context).textTheme.caption),
                    Text("\$40",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .apply(color: Color(0xFF223263))),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tax", style: Theme.of(context).textTheme.caption),
                    Text("\$128",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .apply(color: Color(0xFF223263))),
                  ],
                ),
                SizedBox(height: 12),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Color(0xFFEBF0FF),
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Price",
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .apply(color: Color(0xFF223263))),
                    Text("\$766.86",
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .apply(color: Color(0xFF40BFFF))),
                  ],
                ),
              ],
            ),
          ),
          Container(
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
                Navigator.pushNamed(context, '/DeliveryDetailScreen')
              },
              style: Theme.of(context)
                  .elevatedButtonTheme
                  .style,
              child: Text('Check Out',
                  style:
                  Theme.of(context).textTheme.button),
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
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: MediaQuery.of(context).size.width *
          343 /
          MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height *
          126 /
          MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFEBF0FF)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.all(16),
              height: 83,
              width: 83,
              // margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Color(0xFFEBF0FF),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.58,
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .apply(color: Color(0xFF223263)),
                            text:
                                "Nike Air Max 270 React ENG Nike Air Max 270 React ENG"),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: Icon(Icons.delete_outline,
                          size: 20, color: Color(0xFF9098B1)),
                      onPressed: () => setState(() => _itemCount = 0),
                    ),
                  ],
                ),
                // SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Container(
                    child: Text("\$299,43",
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .apply(color: Color(0xFF40BFFF)),
                        textAlign: TextAlign.start),
                  ),
                  trailing: FittedBox(
                    fit: BoxFit.cover,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 25,
                          width: 30,
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFEBF0FF)),
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(5.0),
                              bottomLeft: const Radius.circular(5.0),
                            ),
                          ),
                          child: _itemCount != 1
                              ? IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  icon: Icon(Icons.remove,
                                      size: 15, color: Color(0xFF9098B1)),
                                  onPressed: () => setState(() => _itemCount--),
                                )
                              : Icon(Icons.remove,
                                  size: 15, color: Color(0xFF9098B1)),
                        ),
                        Container(
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.center,
                          height: 25,
                          width: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFEBF0FF)),
                              color: Color(0xFFEBF0FF)),
                          child: Text(_itemCount.toString(),
                              style: Theme.of(context).textTheme.subtitle2),
                        ),
                        Container(
                          height: 25,
                          width: 30,
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFEBF0FF)),
                            borderRadius: new BorderRadius.only(
                              topRight: const Radius.circular(5.0),
                              bottomRight: const Radius.circular(5.0),
                            ),
                          ),
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              icon: Icon(Icons.add,
                                  size: 15, color: Color(0xFF9098B1)),
                              onPressed: () => setState(() => _itemCount++)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // ),
      // ],
      // ),
    );
  }
}
