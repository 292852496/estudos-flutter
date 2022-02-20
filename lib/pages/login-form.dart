import 'package:flutter/material.dart';
import 'package:flutterando/pages/home-page.dart';

import '../main.dart';

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({Key? key}) : super(key: key);

  @override
  _LoginPageFormState createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  String email = '';
  String password = '';

  void goHomeWithPush() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => MyHomePage(title: 'Home Page'))));
  }

  void goHomeWithPushReplacement() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: ((context) => MyHomePage(title: 'Home Page'))));
  }

  void goHomeWithPushNamed() {
    Navigator.of(context).pushNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImageLogo(),
              TextField(
                onChanged: (value) => {
                  setState(() {
                    email = value;
                  })
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    label: Text("Email"), border: OutlineInputBorder()),
              ),
              Container(
                height: 50,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                decoration: const InputDecoration(
                    label: Text("Password"), border: OutlineInputBorder()),
              ),
              Container(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (password == '123' && email == 'teste') {
                        print('Correto');
                        goHomeWithPushNamed();
                      } else {
                        print("Errado");
                      }
                    });
                  },
                  child: const Text("Entrar"))
            ],
          ),
        ));
  }
}

class ImageLogo extends StatelessWidget {
  const ImageLogo({Key? key}) : super(key: key);

  Widget networkImage() {
    return Image.network(
        'https://www.auditeste.com.br/wp-content/uploads/2020/05/Flutter.jpg');
  }

  Widget assetImage() {
    return Image.asset('lib/assets/images/Flutter.jpg');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: assetImage(),
    );
  }
}
