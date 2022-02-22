import 'package:flutterando/models/product.model.dart';

abstract class ProductState {}

class InitialProductState extends ProductState {}

class LoadingProductState extends ProductState {}

class SuccessProductState extends ProductState {
  List<dynamic> products;

  SuccessProductState(this.products);
}

class ErrorProductState extends ProductState {
  final String message;

  ErrorProductState(this.message);
}
