import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/controllers/imc_controller.dart';

main() {
  IMCController imcController = IMCController();

  test('deve calcular o imc', () {
    imcController.peso.text = '70';
    imcController.altura.text = '2.00';

    imcController.calcular();

    expect(imcController.result, 'Muito magro');
  });
}
