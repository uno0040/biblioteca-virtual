// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'package:application_muito_foda/services/authentication_service.dart';
import 'package:application_muito_foda/Components/snakbar.dart';
import 'package:application_muito_foda/Pages/edit_password.dart';
import 'package:application_muito_foda/Pages/main_admin_screen.dart';
import 'package:application_muito_foda/Pages/main_user_screen.dart';
import 'package:application_muito_foda/Pages/create_user_account.dart';
import 'package:application_muito_foda/services/currentEmail.dart';
import 'package:application_muito_foda/services/firebase_exceptions.dart';
import 'package:flutter/material.dart';

class Login_screen extends StatefulWidget {
  static const String id = 'Login_screen';

  const Login_screen({Key? key}) : super(key: key);

  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_screen> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final _authService = AuthenticationService();

  final String adminEmail = 'admin@email.com';
  final String adminPassword = 'admin@email.com';

  bool obscuredText = true;
  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.deepPurple.shade400,
          Colors.deepPurple.shade200,
          Colors.pink.shade50,
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Blibioteca Pessoal",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Bem-vindo de volta",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: _key,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          // #email e senha
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(171, 171, 171, .7),
                                    blurRadius: 20,
                                    offset: Offset(0, 10)),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200)),
                                  ),
                                  child: TextFormField(
                                    controller: _controllerEmail,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        labelText: "Email",
                                        hintText: 'abc@example.com',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    //validator: (value)=> Validator.validateEmail(value??""),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200)),
                                  ),
                                  child: TextFormField(
                                    controller: _controllerPassword,
                                    obscureText: obscuredText,
                                    decoration: InputDecoration(
                                        labelText: "Senha",
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              obscuredText = !obscuredText;
                                            });
                                          },
                                          child: obscuredText
                                              ? Icon(
                                                  Icons.visibility,
                                                  color: Colors.grey.shade300,
                                                )
                                              : Icon(Icons.visibility_off,
                                                  color: Colors.grey.shade300),
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // Forgot Password
                                Container(
                                    child: TextButton(
                                  onPressed: () => Navigator.pushNamed(
                                      context, Edit_password.id),
                                  style: TextButton.styleFrom(),
                                  child: const Text('Esqueceu a senha?',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold)),
                                )),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),

                          Column(
                            children: [
                              const SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Create_user_account.id);
                                },
                                style: TextButton.styleFrom(),
                                child: Text(
                                  'Não possui uma conta? Cadastre-se',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_key.currentState!.validate()) {
                                    if (_controllerEmail.text == adminEmail &&
                                        _controllerPassword.text ==
                                            adminPassword) {
                                      Navigator.pushNamed(
                                          context, Admin_screen.id);
                                    } else {
                                      //LoaderX.show(context);
                                      final _status = await _authService.login(
                                          email: _controllerEmail.text.trim(),
                                          password: _controllerPassword.text);

                                      if (_status == AuthStatus.successful) {
                                        //LoaderX.hide();
                                        // Caso o login seja bem sucedido vai para a pagina principal
                                        CurrentEmail.set(
                                            _controllerEmail.text.trim());
                                        CurrentEmail.setSenha(
                                            _controllerPassword.text.trim());
                                        Navigator.pushNamed(
                                            context, Main_user_screen.id);
                                      } else {
                                        final error = AuthExceptionHandler
                                            .generateErrorMessage(_status);
                                        CustomSnackBar.showErrorSnackBar(
                                          context,
                                          message: error,
                                        );
                                      }
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.purple.shade800,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  minimumSize: Size(250,
                                      50), // Aumenta o tamanho do botão para 250 de largura e 50 de altura.
                                ),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
