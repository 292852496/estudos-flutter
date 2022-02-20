import 'package:flutter/material.dart';
import 'package:flutterando/controllers/value_notifier_controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ValueNotifierTest extends StatefulWidget {
  const ValueNotifierTest({Key? key}) : super(key: key);

  @override
  _ValueNotifierTest createState() => _ValueNotifierTest();
}

class _ValueNotifierTest extends State<ValueNotifierTest> {
  ValueNotifierTestController controller = ValueNotifierTestController();

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                alignment: Alignment.center,
                child: ValueListenableBuilder(
                    valueListenable: controller.counter,
                    builder: (context, value, _) {
                      return Text(controller.counter.value.toString());
                    })),
            Container(
                alignment: Alignment.center,
                child: RxBuilder(builder: (context) {
                  return Text(controller.counterWithRxValue.toString());
                })),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (() {
              setState(() {
                controller.increment();
              });
            }),
            child: const Icon(Icons.plus_one)));
  }
}
