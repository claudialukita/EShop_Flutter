import 'package:eshop_flutter/core/models/checkout.dart';
import 'package:eshop_flutter/delivery_detail/view_model/commit_addres_view_model.dart';
import 'package:eshop_flutter/delivery_detail/view_model/select_address_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<AddressDetail> initAddressDetail = [];
    AddressDetail addressDetail;

    addressDetail = new AddressDetail(
        "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States",
        "+99 1234567890",
        "Priscekila");

    initAddressDetail.add(addressDetail);

    addressDetail = new AddressDetail(
        "2809 Spring Hill Rd Tallahassee, Nevada 52874 United States",
        "+99 1234562809",
        "Ahmad Khaidir");

    initAddressDetail.add(addressDetail);

    return ListView(children: <Widget>[
      Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.71,
            child: ListView(
              children: new List.generate(
                2,
                (i) => new ListTileItem(
                  idx: i,
                  initAddressDetail: initAddressDetail,
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
            child: Consumer(builder: (context, watch, widget) {
              int idxCommitAddress = watch(selectAddressViewModelProvider);
              return ElevatedButton(
                onPressed: () => {
                  Navigator.pushNamed(context, '/CardDetailScreen'),
                  context
                      .read(commitAddressViewModelProvider.notifier)
                      .commitAddress(
                          initAddressDetail[idxCommitAddress].street,
                          initAddressDetail[idxCommitAddress].phoneNumber,
                          initAddressDetail[idxCommitAddress].receiptName)
                },
                style: idxCommitAddress >= 0
                    ? Theme.of(context).elevatedButtonTheme.style
                    : ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        primary: Color(0xFFEBF0FF).withOpacity(0.3),
                        fixedSize: Size(343, 57),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        elevation: 3,
                      ),
                child: Text('Next', style: Theme.of(context).textTheme.button),
              );
            }),
          ),
        ],
      ),
    ]);
  }
}

class ListTileItem extends StatefulWidget {
  int idx;
  List<AddressDetail> initAddressDetail;
  ListTileItem({required this.idx, required this.initAddressDetail});
  @override
  _ListTileItemState createState() => new _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  @override
  Widget build(BuildContext context) {
    int idx = widget.idx;
    List<AddressDetail> initAddressDetail = widget.initAddressDetail;

    return GestureDetector(
      onTap: () => {
        context.read(selectAddressViewModelProvider.notifier).selectSize(idx),
        // Navigator.pushNamed(context, '/ProductDetailScreen',
        //     arguments:
        //         ShoeIdName(_state.data![index].id, _state.data![index].name))
        print("clicked ${widget.idx}")
      },
      child: Consumer(
        builder: (context, watch, widget) {
          var stateAddress = watch(selectAddressViewModelProvider);
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
              border: Border.all(
                  color: stateAddress == idx
                      ? Color(0xFF40BFFF)
                      : Color(0xFFEBF0FF)),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(initAddressDetail[idx].receiptName,
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
                        text: initAddressDetail[idx].street),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  child: Text(initAddressDetail[idx].phoneNumber,
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
                        child: Text('Edit',
                            style: Theme.of(context).textTheme.button),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      constraints: BoxConstraints(),
                      icon: Icon(Icons.delete_outline,
                          size: 30, color: Color(0xFF9098B1)),
                      onPressed: () => {},
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
