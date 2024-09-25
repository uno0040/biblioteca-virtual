// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:application_muito_foda/Components/snakbar.dart';
import 'package:application_muito_foda/Pages/login_screen.dart';
import 'package:application_muito_foda/services/authentication_service.dart';
import 'package:application_muito_foda/services/firebase_exceptions.dart';

class Edit_password extends StatefulWidget {
  static const String id = 'Edit_password';

  const Edit_password({Key? key}) : super(key: key);

  @override
  State<Edit_password> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<Edit_password> {
  final _key = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();
  final _authService = AuthenticationService();

  @override
  void dispose() {
    _controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            Colors.purple.shade900,
            Colors.purple.shade700,
            Colors.purple.shade500,
          ],
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Blibioteca Pessoal",
                      style: TextStyle(color: Colors.white, fontSize: 40)),
                  SizedBox(height: 10),
                  Text(
                    "Esqueceu a sua senha?",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(171, 171, 171, .7),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      'Informe o email de cadastro, enviaremos um link com instruções para recuperação da sua senha.',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple.shade800,
                                      ),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    padding: const EdgeInsets.all(20),
                                    child: TextFormField(
                                        controller: _controllerEmail,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            labelText: "Email",
                                            hintText: 'abc@example.com',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none))),
                                Container(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_key.currentState!.validate()) {
                                        final _status =
                                            await _authService.resetPassword(
                                                email: _controllerEmail.text
                                                    .trim());
                                        if (_status == AuthStatus.successful) {
                                          CustomSnackBar.showSuccessSnackBar(
                                              context,
                                              message:
                                                  'As instruções foram enviadas para o seu email com sucesso!');
                                          Navigator.pushNamed(
                                              context, Login_screen.id);
                                        } else {
                                          final error = AuthExceptionHandler
                                              .generateErrorMessage(_status);
                                          CustomSnackBar.showErrorSnackBar(
                                              context,
                                              message: error);
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.purple.shade800,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        minimumSize: Size(240, 50)),
                                    child: const Text(
                                      'Enviar',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(child: SizedBox(height: 20))
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
