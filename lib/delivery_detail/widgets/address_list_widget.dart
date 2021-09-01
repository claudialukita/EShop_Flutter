import 'package:eshop_flutter/core/models/checkout.dart';
import 'package:eshop_flutter/core/providers/cart_address_provider.dart';
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

    return ListView(
        shrinkWrap: true,
        children: <Widget>[
      Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: MediaQuery.of(context).size.height * 0.65,
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
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF40BFFF).withOpacity(0.3),
                  spreadRadius: 7,
                  blurRadius: 10,
                  offset: Offset(0, 7),// changes position of shadow
                ),
              ],
            ),
            child: Consumer(builder: (context, watch, widget) {
              int idxCommitAddress = watch(selectAddressViewModelProvider);
              return ElevatedButton(
                onPressed: idxCommitAddress >= 0
                    ? () => {
                  Navigator.pushNamed(context, '/CardDetailScreen'),
                  context
                      .read(commitAddressProvider.notifier)
                      .commitAddress(
                          initAddressDetail[idxCommitAddress].street,
                          initAddressDetail[idxCommitAddress].phoneNumber,
                          initAddressDetail[idxCommitAddress].receiptName)
                } : () => {},
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
        context.read(selectAddressViewModelProvider.notifier).selectAddress(idx),
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
            margin: EdgeInsets.symmetric(vertical: 8),
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
                            blurRadius: 10,
                            offset: Offset(0, 7), // changes position of shadow
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
                    SizedBox(width: 10),
                    Material (
                      child: IconButton(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        constraints: BoxConstraints(),
                        icon: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          width: 17.75,
                          height: 20,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: ImageIcon(
                              AssetImage("assets/images/trash_icon.png"),
                              color: Color(0xFF9098B1),
                            ),
                          ),
                        ),
                        onPressed: () => {},
                      ),
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
