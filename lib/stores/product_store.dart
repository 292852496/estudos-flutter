import 'package:flutterando/models/product.model.dart';

abstract class ProductStore {}

class InitialProductState extends ProductStore {}

class LoadingProductState extends ProductStore {}

class SuccessProductState extends ProductStore {
  List<dynamic> products;

  SuccessProductState(this.products);
}

class ErrorProductState extends ProductStore {
  final String message;

  ErrorProductState(this.message);
}
