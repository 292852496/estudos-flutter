import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterando/blocs/search_cep_bloc.dart';
import 'package:flutterando/pages/validators.dart';
import 'package:flutterando/states/search_cep_state.dart';

class ConsultCEPWidget extends StatefulWidget {
  const ConsultCEPWidget({Key? key}) : super(key: key);

  @override
  _ConsultCEPWidgetState createState() => _ConsultCEPWidgetState();
}

class _ConsultCEPWidgetState extends State<ConsultCEPWidget> {
  TextEditingController inputCPFController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                          if (formKey.currentState!.validate()) {
                            context
                                .read<SearchCepBloc>()
                                .add(inputCPFController.value.text);
                          }
                        },
                        child: const Text("PESQUISAR")),
                    const SizedBox(
                      height: 50,
                    ),
                    Expanded(
                        child: BlocBuilder<SearchCepBloc, SearchCepState>(
                            bloc: context.read<SearchCepBloc>(),
                            builder: (context, state) {
                              if (state is SearchCepError) {
                                return throw Exception(state.message);
                              }
                              if (state is SearchCepStart) {
                                return Container();
                              }

                              if (state is SearchCepLoading) {
                                return const CircularProgressIndicator();
                              }
                              return Text(
                                  "Localidade do CEP: ${(state as SearchCepSuccess).data.localidade.toString()}");
                            }))
                  ],
                ))));
  }
}
