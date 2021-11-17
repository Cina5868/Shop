import 'package:flutter/material.dart';
import 'package:shop/CardOfItems.dart';
import 'package:shop/BuyPage_Product.dart';

class buyPage extends StatefulWidget {
  const buyPage({Key? key}) : super(key: key);

  @override
  _buyPageState createState() => _buyPageState();
}

class _buyPageState extends State<buyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("سفارشات", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: BasketUI(),
    );
  }

  Widget BasketUI() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 70),
          child: ListView.builder(
            itemCount: BuyPageItems.getInstance().basketItems.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                child: Padding(
                    padding: EdgeInsets.only(left: 15, top: 10, right: 15),
                    child: BuyItemsView(
                        BuyPageItems.getInstance().basketItems[position],
                        position,
                        removeItem)),
              );
            },
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.red,
                  child: InkWell(
                    onTap: () => {},
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      height: 60,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 130.0, right: 130.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.payment_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'پرداخت',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))),
      ],
    );
  }

  void removeItem(int index) {
    setState(() {
      BuyPageItems.getInstance().basketItems.removeAt(index);
    });
  }
}
