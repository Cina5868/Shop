import 'package:flutter/material.dart';

class shop_bottom extends StatelessWidget {
  const shop_bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: Colors.blueGrey,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width / 2 - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home_filled, color: Colors.white),
                  Icon(Icons.account_circle, color: Colors.white)
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2 - 20,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.search, color: Colors.white),
                  Icon(Icons.shopping_basket, color: Colors.white)
                ],
              ),
            )
          ],
        ),
      ),
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      clipBehavior: Clip.antiAlias,
    );
  }
}
