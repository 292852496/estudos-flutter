import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterando/pages/validators.dart';
import 'package:string_validator/string_validator.dart' as string_validator;

class LearnFormWidget extends StatefulWidget {
  const LearnFormWidget({Key? key}) : super(key: key);

  @override
  _LearnFormWidgetState createState() => _LearnFormWidgetState();
}

class _LearnFormWidgetState extends State<LearnFormWidget> {
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passFieldController = TextEditingController();
  TextEditingController cpfFieldController = TextEditingController();
  final cpfMask = CPFMask();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscurePassField = true;
  bool checkboxState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FormFieldsWidget(
                      controller: emailFieldController,
                      labelText: 'Email',
                      hintText: 'Digite seu email',
                      prefixIcon: const Icon(Icons.email),
                      validator: (text) {
                        if (!string_validator.isEmail(text.toString())) {
                          return 'must be an email type';
                        }
                        return null;
                      },
                      saved: (text) {
                        print("Test onSave email");
                      },
                    ),
                    FormFieldsWidget(
                      controller: cpfFieldController,
                      labelText: 'CPF',
                      hintText: 'Digite seu cpf',
                      prefixIcon: const Icon(Icons.document_scanner),
                      inputFormatter: [MaskInput('###.###.###-##')],
                      validator: (text) {
                        if (!RegExp(r'^\d{3}\.\d{3}\.\d{3}\-\d{2}$')
                            .hasMatch(text)) {
                          return 'Digite um CPF Válido';
                        }
                        return null;
                      },
                      saved: (text) {
                        print("Test onSave password");
                      },
                    ),
                    FormFieldsWidget(
                      controller: passFieldController,
                      labelText: 'Password',
                      obscurePassField: true,
                      hintText: 'Digite seu password',
                      prefixIcon: const Icon(Icons.vpn_key),
                      validator: (text) {
                        return null;
                      },
                      saved: (text) {
                        print("Test onSave password");
                      },
                    ),
                    Row(children: [
                      Checkbox(
                          value: checkboxState,
                          onChanged: (value) {
                            setState(() {
                              checkboxState = value!;
                            });
                          }),
                      const Text("Aceitar termos"),
                    ]),
                    ValueListenableBuilder(
                        valueListenable: emailFieldController,
                        builder: (context, value, child) {
                          return Text(
                              emailFieldController.value.text.toString());
                        }),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: !checkboxState
                                ? null
                                : () {
                                    setState(() {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState?.save();
                                      }
                                    });
                                  },
                            child: const Text("ENTRAR"))),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              formKey.currentState?.reset();
                            },
                            child: const Text("RESET"))),
                    const SizedBox(
                      height: 200,
                    )
                  ],
                ))));
  }
}

class FormFieldsWidget extends StatefulWidget {
  const FormFieldsWidget({
    Key? key,
    required this.controller,
    this.obscurePassField = false,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    required this.saved,
    this.inputFormatter,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscurePassField;
  final String labelText;
  final String hintText;
  final validator;
  final saved;
  final inputFormatter;
  final Widget prefixIcon;

  @override
  _FormFieldsWidget createState() => _FormFieldsWidget();
}

class _FormFieldsWidget extends State<FormFieldsWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        inputFormatters:
            (widget.inputFormatter == null) ? [] : widget.inputFormatter,
        obscureText: widget.obscurePassField,
        controller: widget.controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: widget.labelText,
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText),
        onSaved: widget.saved);
  }
}
