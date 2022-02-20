import 'package:flutter/material.dart';

class LayoutWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const LoadingCircularWidget();
  }
}

class AlignWidget extends StatelessWidget {
  const AlignWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          height: 200,
          width: 200,
          color: Colors.black,
          child: Center(
            child: Container(height: 100, width: 100, color: Colors.green),
          )),
    );
  }
}

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          width: 500,
          color: Colors.blue,
        ),
        Container(
          height: 300,
          width: 300,
          color: Colors.yellow,
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.purple,
        ),
        const Card(
          child: Text("This is Card Widget."),
        )
      ],
    );
  }
}

class ListViewBuilderWidget extends StatelessWidget {
  const ListViewBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("App")),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(title: Text("Item $index"));
            }));
  }
}

class LoadingCircularWidget extends StatelessWidget {
  const LoadingCircularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
