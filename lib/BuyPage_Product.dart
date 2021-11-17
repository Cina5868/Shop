import 'Product.dart';
class BuyPageItems{
  static var _instance ;
  var _basketItems = <Product>[];
  BuyPageItems(){
    _basketItems = <Product>[];
  }

  get basketItems => _basketItems;

  set basketItems(value) {
    _basketItems = value;
  }

  static BuyPageItems getInstance(){
    if(_instance==null){
        _instance=BuyPageItems();
    }
    return _instance;
  }
}
