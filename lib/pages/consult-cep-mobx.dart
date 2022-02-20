import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterando/pages/validators.dart';
import 'package:mobx/mobx.dart';
import 'package:flutterando/mobx/search_cep_mobx_store.dart';

class ConsultCEPWidgetMobx extends StatefulWidget {
  const ConsultCEPWidgetMobx({Key? key}) : super(key: key);

  @override
  _ConsultCEPWidgetMobxState createState() => _ConsultCEPWidgetMobxState();
}

class _ConsultCEPWidgetMobxState extends State<ConsultCEPWidgetMobx> {
  TextEditingController inputCPFController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SearchCepMobxStore searchCepMobx = SearchCepMobxStore();

  final overlayingLoader = OverlayEntry(builder: (context) {
    return Container(
      color: Colors.black45,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  });

  @override
  void initState() {
    super.initState();
    reaction<bool>((_) => searchCepMobx.loading, (load) {
      if (load) {
        Overlay.of(context)!.insert(overlayingLoader);
      } else {
        overlayingLoader.remove();
      }
    });

    reaction<Exception>((_) => searchCepMobx.error, (Exception error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error.toString()), backgroundColor: Colors.red));
    });

    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
            key: formKey,
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                        inputFormatters: [MaskInput('########')],
                        controller: inputCPFController,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Preencha o campo com um CEP";
                          }
                          if (!RegExp(r'^[\d]+$').hasMatch(value)) {
                            return "Digite um CPF válido";
                          }
                          return null;
                        }),
                        decoration: const InputDecoration(labelText: 'CEP')),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (formKey.currentState!.validate()) {
                              searchCepMobx
                                  .searchCep(inputCPFController.value.text);
                            }
                          });
                        },
                        child: const Text("PESQUISAR")),
                    const SizedBox(
                      height: 50,
                    ),
                    Expanded(child: Observer(builder: (context) {
                      return (searchCepMobx.state.localidade != null)
                          ? Text(
                              "Localidade do CEP: ${searchCepMobx.state.localidade}")
                          : Container();
                    }))
                  ],
                ))));
  }
}
