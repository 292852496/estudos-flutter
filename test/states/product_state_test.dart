import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/states/product_state.dart';
import 'package:flutterando/stores/product_store.dart';

main() {
  ProductState myState = ProductState();
  SuccessProductState successState = SuccessProductState([]);

  test('Deve retornar uma lista de produtos', () async {
    await myState.fetchProducts();
    expect(myState.value, isA<SuccessProductState>()); //precisa ligar o dartion
  });
}
