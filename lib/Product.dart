class Product {
  late String _productName;
  late int _id;
  late String _price;
  late bool _off;
  late String _imageUrl;
  late String _description;

  Product(this._productName, this._id, this._price, this._off, this._imageUrl,
      this._description);

  String get description => _description;

  String get imageUrl => _imageUrl;

  bool get off => _off;

  String get price => _price;

  int get id => _id;

  String get productName => _productName;
}