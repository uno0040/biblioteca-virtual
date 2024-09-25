// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:application_muito_foda/Components/snakbar.dart';
import 'package:application_muito_foda/Objects/book_model.dart';
import 'package:application_muito_foda/Objects/user_model.dart';
import 'package:application_muito_foda/Repositories/user_repository.dart';
import 'package:application_muito_foda/services/authentication_service.dart';
import 'package:application_muito_foda/services/currentEmail.dart';
import 'package:application_muito_foda/services/firebase_exceptions.dart';
import 'package:application_muito_foda/user.dart';
import 'package:get/get.dart';
import 'package:application_muito_foda/Repositories/user_repository.dart';

class ConfigScreen extends StatefulWidget {
  static const String id =
      'config_screen'; // Identificador da tela de configurações

  const ConfigScreen({Key? key}) : super(key: key);

  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  bool showPassword = false;
  List<String> userInf = User.getAllInfo();

  String name = User.name;
  String email = User.email;
  String cep = User.cep;
  String city = User.city;
  String street = User.street;
  String neighborhood = User.neighborhood;
  String number = User.number;

  //não tocar nessas variaveis
  final _key = GlobalKey<FormState>();
  final _password = TextEditingController();
  final _newpassword = TextEditingController();
  final _confirmpassword = TextEditingController();
  final _authService = AuthenticationService();
  bool obscuredText = true;

  @override
  Widget build(BuildContext context) {  
    final userRepo = Get.put(UserRepository());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: FutureBuilder (
            future: userRepo.getUserDetails(CurrentEmail.get()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel datainfo = snapshot.data as UserModel;
                return ListView(
                children: [
                  Text(
                    "Configurações do perfil",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nome',
                          style:
                              TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                      SizedBox(height: 5),
                      Text(datainfo.name,
                          style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Container(
                        height: 1.2,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(height: 15),
                      Text('Email',
                          style:
                              TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                      SizedBox(height: 5),
                      Text(datainfo.email,
                          style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Container(
                        height: 1.2,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(height: 15),
                      Text('Senha',
                          style:
                              TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                      SizedBox(height: 5),
                      Text('*****',
                          style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Container(
                        height: 1.2,
                        color: Colors.grey.shade400,
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return AlertDialog(
                                    title: Text('Altere sua senha'),
                                    content: Form(
                                        key: _key,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(
                                              controller: _password,
                                              obscureText: obscuredText,
                                              decoration: InputDecoration(
                                                  labelText: 'Senha atual',
                                                  suffixIcon: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          obscuredText =
                                                              !obscuredText;
                                                        });
                                                      },
                                                      child: obscuredText
                                                          ? Icon(
                                                              Icons.visibility,
                                                              color: Colors
                                                                  .grey.shade300,
                                                            )
                                                          : Icon(
                                                              Icons.visibility_off,
                                                              color: Colors
                                                                  .grey.shade300)),
                                                  hintStyle:
                                                      TextStyle(color: Colors.grey),
                                                  border: InputBorder.none),
                                            ),
                                            TextField(
                                              controller: _newpassword,
                                              decoration: InputDecoration(
                                                  labelText: 'Nova senha',
                                                  border: InputBorder.none),
                                            ),
                                            TextField(
                                              controller: _confirmpassword,
                                              decoration: InputDecoration(
                                                  labelText:
                                                      'Confirme a nova senha',
                                                  border: InputBorder.none),
                                            )
                                          ],
                                        )),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            if (_key.currentState!.validate()) {
                                              //checar se as senha colocada é a senha atual do usuario
                                              if (CurrentEmail.getSenha() ==
                                                  _password.text.trim()) {
                                                CustomSnackBar.showErrorSnackBar(
                                                    context,
                                                    message:
                                                        'Senha incorreta, por favor tente novamente');
                                                _password.clear();
                                                _newpassword.clear();
                                                _confirmpassword.clear();
                                              } else if (_newpassword.text.trim() !=
                                                  _confirmpassword.text.trim()) {
                                                CustomSnackBar.showErrorSnackBar(
                                                    context,
                                                    message:
                                                        'As senhas não coincidem');
                                                _password.clear();
                                                _newpassword.clear();
                                                _confirmpassword.clear();
                                              } else {
                                                final _status = await _authService
                                                    .changePassword(
                                                        email: CurrentEmail.get(),
                                                        password:
                                                            CurrentEmail.getSenha(),
                                                        newPassword: _newpassword
                                                            .text
                                                            .trim());
                                                if (_status ==
                                                    AuthStatus.successful) {
                                                  CustomSnackBar.showSuccessSnackBar(
                                                      context,
                                                      message:
                                                          'Sua senha foi alterada com sucesso');
                                                  Navigator.of(context).pop();
                                                } else {
                                                  final error = AuthExceptionHandler
                                                      .generateErrorMessage(
                                                          _status);
                                                  CustomSnackBar.showErrorSnackBar(
                                                      context,
                                                      message: error);
                                                  _password.clear();
                                                  _newpassword.clear();
                                                  _confirmpassword.clear();
                                                }
                                              }
                                            }
                                          },
                                          child: const Text(
                                            'Alterar',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.purple,
                                                fontWeight: FontWeight.bold),
                                          )),
    
                                      //Botão para cancelar
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancelar',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold))),
                                    ],
                                  );
                                });
                          },
                          child: const Text('Alterar senha',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(height: 25),
                      Text('Informações de endereço',
                          style:
                              TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                      SizedBox(height: 35),
                      Text('CEP',
                          style:
                              TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                      SizedBox(height: 5),
                      Text(datainfo.cep,
                          style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Container(
                        height: 1.2,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Cidade',
                          style:
                              TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                      SizedBox(height: 5),
                      Text(datainfo.city,
                          style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Container(
                        height: 1.2,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Rua',
                          style:
                              TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                      SizedBox(height: 5),
                      Text(datainfo.street,
                          style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Container(
                        height: 1.2,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bairro',
                                    style: TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(datainfo.neighborhood,
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Container(
                                  height: 1.2,
                                  width: 300,
                                  color: Colors.grey.shade400,
                                ),
                              ]),
                          SizedBox(
                            width: 300,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Numero',
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 5,
                              ),
                              Text(datainfo.number,
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 1.2,
                                width: 300,
                                color: Colors.grey.shade400,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
          );
              } else if (snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return Center(child: Text('Algo deu errado :('));  
              }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        
          ),
      ),
    );
  }

}