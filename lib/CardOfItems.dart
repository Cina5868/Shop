import 'package:flutter/material.dart';
import 'package:shop/Product.dart';

typedef onPressedRemove(int index);
class BuyItemsView extends StatefulWidget {
  late Product _product;
  int count = 1;
  late int index;
  late onPressedRemove _onPressedRemove;
  BuyItemsView(
      this._product,
      this.index,
      this._onPressedRemove
      );

  @override
  _BuyItemsViewState createState() => _BuyItemsViewState();
}

class _BuyItemsViewState extends State<BuyItemsView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 170,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: TextDirection.rtl,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: 10.0, left: 10.0, top: 20.0, bottom: 60.0),
              child: Image.network(
                widget._product.imageUrl,
                width: 100,
                height: 100,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 30, top: 30),
                    child: Text(
                      widget._product.productName,
                      style: TextStyle(fontSize: 19),
                    )),
                Padding(
                  padding: EdgeInsets.only(right: 15, bottom: 30),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (widget.count > 1) {
                              widget.count--;
                            }
                          });
                        },
                        child: Icon(Icons.chevron_left, size: 30),
                      ),
                      Text(widget.count.toString()),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.count++;
                            });
                          },
                          child: Icon(
                            Icons.chevron_right,
                            size: 30,
                          ))
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(children: [
                  GestureDetector(
                    onTap: (){
                      widget._onPressedRemove(widget.index);
                    },
                    child: Icon(
                      Icons.delete_rounded,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    widget._product.price,
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  )
                ]),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
