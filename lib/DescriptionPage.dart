import 'package:flutter/material.dart';
import 'package:shop/BuyPage.dart';
import 'package:shop/BuyPage_Product.dart';
import 'Product.dart';

class descriptionPage extends StatelessWidget {
  late Product _product;
  descriptionPage(this._product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("فروشگاه", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon : Icon(Icons.arrow_back_ios_new,color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => buyPage()));
            },
            icon: Icon(Icons.shopping_basket),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Align(
            child: Text(
              "کفش",
              style: TextStyle(color: Colors.black54, fontSize: 40),
            ),
            alignment: Alignment.topCenter,
          ),
          Center(
            child: Image.network(
              _product.imageUrl,
              width: 200,
              height: 200,
            ),
          ),
          Text(
            _product.price + " تومان",
            style: TextStyle(color: Colors.blueGrey, fontSize: 20),
          ),
          Text(
            _product.productName,
            style: TextStyle(color: Colors.blueGrey, fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              _product.description,
              style: TextStyle(color: Colors.black54, fontSize: 13),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Align(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    int count = 0 ;
                    for(int item = 0;item < BuyPageItems.getInstance().basketItems.length;item++){
                      if(BuyPageItems.getInstance().basketItems[item]==_product){
                        count++;
                      }
                    }
                    if (count==0){
                      BuyPageItems.getInstance().basketItems.add(_product);
                      print("added");
                    }
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => buyPage()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 60,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.red),
                    child: Center(
                      child: Text(
                        "افزودن به سبد خرید",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ),
        ],
      ),
    );
  }
}
