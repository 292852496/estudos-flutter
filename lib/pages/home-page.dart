import 'package:flutter/material.dart';

import 'app-controller.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  int counter = 0;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset('lib/assets/images/no_image.png')),
            accountName: const Text("Thiago F Silva"),
            accountEmail: const Text("teste@email.com"),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            subtitle: const Text('Tela de inicio.'),
            onTap: () {
              print('home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.door_back_door),
            title: const Text('Sair'),
            subtitle: const Text('Finalizar sessão.'),
            onTap: () {
              print('logout');
              Navigator.of(context).pushReplacementNamed('/login-form-page');
            },
          )
        ],
      )),
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [
          CustomSwitch(),
        ],
      ),
      body: Container(alignment: Alignment.center, child: const CustomSwitch()),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitch();
}

class _CustomSwitch extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Switch Button:  "),
        Switch(
            value: controller.isDarkTheme,
            onChanged: (value) {
              setState(() {
                controller.changeTheme();
              });
            })
      ],
    );
  }
}
