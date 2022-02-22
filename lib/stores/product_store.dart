import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterando/models/product.model.dart';
import 'package:flutterando/states/product_state.dart';
import 'package:http/http.dart' as http;

class ProductStore extends ValueNotifier<ProductState> {
  ProductStore() : super(InitialProductState());

  Future fetchProducts() async {
    value = LoadingProductState();
    try {
      Uri uri = Uri.parse(Uri.encodeFull('http://localhost:3031/products'));
      final httpResponseProducts = await http.get(uri);

      final listProducts = jsonDecode((httpResponseProducts.body)) as List;
      listProducts.map((e) => ProductModel.fromJSON(e));
      value = SuccessProductState(listProducts);
    } catch (e) {
      value = ErrorProductState('Ocorreu um erro');
    }
  }
}
