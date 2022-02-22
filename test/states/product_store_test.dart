import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/stores/product_store.dart';
import 'package:flutterando/states/product_state.dart';

main() {
  ProductStore myStore = ProductStore();
  SuccessProductState successState = SuccessProductState([]);

  test('Deve retornar uma lista de produtos', () async {
    await myStore.fetchProducts();
    expect(myStore.value, isA<SuccessProductState>()); //precisa ligar o dartion
  });
}
