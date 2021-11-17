import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop/ShopBottom.dart';
import 'package:http/http.dart';
import 'Product.dart';
import 'DescriptionPage.dart';
import 'BuyPage.dart';

void main() => runApp(MainMaterial());

class MainMaterial extends StatelessWidget {
  const MainMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyShop(),
    );
  }
}

class MyShop extends StatefulWidget {
  const MyShop({Key? key}) : super(key: key);

  @override
  _MyShopState createState() => _MyShopState();
}

class _MyShopState extends State<MyShop> {
  List<Product> items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }

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
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: List.generate(items.length, (int position) {
          return generator(items[position], context);
        }),
      ),
      bottomNavigationBar: shop_bottom(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {null},
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void fetchProducts() async {
    var url = Uri.parse('http://welearnacademy.ir/flutter/products_list.json');
    Response response = await get(url);
    setState(() {
      var jsonProducts = json.decode(utf8.decode(response.bodyBytes));
      for (var item in jsonProducts) {
        var product = Product(item['product_name'], item['id'], item['price'],
            item['off'], item['image_url'], item['description']);
        items.add(product);
        if (item == 0) {
          print(product);
        }
      }
    });
  }
}

Card generator(Product product, context) {
  return Card(
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => descriptionPage(product)));
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 90,
                height: 90,
                child: Image.network(
                  product.imageUrl,
                  color: Colors.blueGrey,
                )),
            Text(
              product.price,
              style: TextStyle(color: Colors.red),
            ),
            Text(
              product.productName,
              style: TextStyle(color: Colors.blueGrey),
            )
          ],
        ),
      ),
    ),
  );
}
