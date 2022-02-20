import 'package:flutter/material.dart';
import 'package:flutterando/controllers/imc_controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CalcIMCWidget extends StatefulWidget {
  const CalcIMCWidget({Key? key}) : super(key: key);

  @override
  _CalcIMCWidgetState createState() => _CalcIMCWidgetState();
}

class _CalcIMCWidgetState extends State<CalcIMCWidget> {
  IMCController imcController = IMCController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: formKey,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "O campo não pode ser nulo";
                      }
                    },
                    controller: imcController.peso,
                    decoration: const InputDecoration(
                        labelText: 'Peso', border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "O campo não pode ser nulo";
                      }
                    },
                    controller: imcController.altura,
                    decoration: const InputDecoration(
                        labelText: 'Altura', border: OutlineInputBorder()),
                  ),
                  SizedBox(
                      width: 400,
                      height: 50,
                      child: ElevatedButton(
                          child: imcController.result.value.isNotEmpty
                              ? const Text("CALCULAR NOVAMENTE")
                              : const Text("CALCULAR"),
                          onPressed: () {
                            setState(() {
                              if (formKey.currentState!.validate()) {
                                imcController.calcular();
                              }
                            });
                          })),
                  RxBuilder(builder: (context) {
                    return Row(children: [
                      imcController.result.value.isNotEmpty
                          ? Text("Resultado: ${imcController.result.value}")
                          : const Text(""),
                    ]);
                  }),
                  const SizedBox(
                    height: 400,
                  )
                ],
              ))),
    );
  }
}
