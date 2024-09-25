// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:application_muito_foda/Components/snakbar.dart';
import 'package:application_muito_foda/Objects/user_model.dart';
import 'package:application_muito_foda/Pages/main_user_screen.dart';
import 'package:application_muito_foda/Repositories/user_repository.dart';
import 'package:application_muito_foda/services/api_cep.dart';
import 'package:application_muito_foda/services/authentication_service.dart';
import 'package:application_muito_foda/services/firebase_exceptions.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:application_muito_foda/user.dart';
import 'package:search_cep/search_cep.dart';

class Create_user_account extends StatefulWidget {
  static const String id = 'Create_user_accountState';

  const Create_user_account({Key? key}) : super(key: key);

  @override
  Create_user_accountState createState() => Create_user_accountState();
}

class Create_user_accountState extends State<Create_user_account> {
  static List<User> userlist = [];

  final _phoneMaskFormatter = MaskTextInputFormatter(
      mask: "(##) #####-####",
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  final _dateMaskFormatter = MaskTextInputFormatter(
      mask: "##/##/####",
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  final _cepMaskFormatter = MaskTextInputFormatter(
      mask: "#####-###", type: MaskAutoCompletionType.lazy);
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodePhone = FocusNode();
  final FocusNode _focusNodeBirth = FocusNode();
  final FocusNode _focusCep = FocusNode();
  final FocusNode _focusStreet = FocusNode();
  final FocusNode _focusNeighborhood = FocusNode();
  final FocusNode _focusNumber = FocusNode();
  final FocusNode _focusCity = FocusNode();

  final TextEditingController _controllerCep = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerBirth = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerStreet = TextEditingController();
  final TextEditingController _controllerNeighborhood = TextEditingController();
  final TextEditingController _controllerNumber = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();

  final _authService = AuthenticationService();
  final _key = GlobalKey<FormState>();

  Future<void> cadastraUsuario() async {
    String name = _controllerName.text;
    String email = _controllerEmail.text;
    String phone = _controllerPhone.text;
    String birth = _controllerBirth.text;
    String password = _controllerPassword.text;
    String cep = _controllerCep.text;
    String street = _controllerStreet.text;
    String neighborhood = _controllerNeighborhood.text;
    String number = _controllerNumber.text;
    String city = _controllerCity.text;

    final userRepo = Get.put(UserRepository());
    
    if (name.isNotEmpty &&
        email.isNotEmpty &&
        phone.isNotEmpty &&
        birth.isNotEmpty &&
        password.isNotEmpty) {

      // chama o repositório de usuarios para adicionar o usuario sendo cadastrado
      // no banco de dados
      User.setUser(name, email, password, phone, birth, cep, street,
          neighborhood, number, city);

      // Cadastra o usuário no banco de dados    
      await userRepo.createUser(
        UserModel(name: name,
                  email: email,
                  phone: phone,
                  birth: birth,
                  password: password, 
                  cep: cep, 
                  street: street, 
                  neighborhood: neighborhood, 
                  city: city, 
                  number: number)
      );
      setState(() {});

      // Limpar os campos após o cadastro
      _controllerName.clear();
      _controllerEmail.clear();
      _controllerPhone.clear();
      _controllerBirth.clear();
      _controllerPassword.clear();
      _controllerCep.clear();
      _controllerStreet.clear();
      _controllerNeighborhood.clear();
      _controllerNumber.clear();
      _controllerCity.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.purple.shade900,
            Colors.purple.shade700,
            Colors.purple.shade500,
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
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
                      "Cadastre-se",
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
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(171, 171, 171, .7),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)),
                                  ]),
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
                                      controller: _controllerName,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        labelText: 'Nome',
                                      ),
                                      onEditingComplete: () =>
                                          _focusNodeEmail.requestFocus(),
                                    ),
                                  ),

                                  //email
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200)),
                                    ),
                                    child: TextFormField(
                                      focusNode: _focusNodeEmail,
                                      controller: _controllerEmail,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                      ),
                                      onEditingComplete: () =>
                                          _focusNodePhone.requestFocus(),
                                    ),
                                  ),

                                  //phone
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200)),
                                    ),
                                    child: TextFormField(
                                      focusNode: _focusNodePhone,
                                      controller: _controllerPhone,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [_phoneMaskFormatter],
                                      decoration: InputDecoration(
                                        labelText: 'Telefone',
                                      ),
                                      onEditingComplete: () =>
                                          _focusNodeBirth.requestFocus(),
                                    ),
                                  ),

                                  //birth
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200)),
                                    ),
                                    child: TextFormField(
                                      focusNode: _focusNodeBirth,
                                      controller: _controllerBirth,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [_dateMaskFormatter],
                                      decoration: InputDecoration(
                                        labelText: 'Data de nascimento',
                                      ),
                                      onEditingComplete: () =>
                                          _focusNodePassword.requestFocus(),
                                    ),
                                  ),

                                  //Senha
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200)),
                                    ),
                                    child: TextFormField(
                                      focusNode: _focusNodePassword,
                                      controller: _controllerPassword,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                        labelText: 'Senha',
                                      ),
                                      onEditingComplete: () =>
                                          _focusCep.requestFocus(),
                                    ),
                                  ),
                                  //cep
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200)),
                                    ),
                                    child: TextFormField(
                                      focusNode: _focusCep,
                                      controller: _controllerCep,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [_cepMaskFormatter],
                                      decoration: InputDecoration(
                                        labelText: 'CEP',
                                      ),
                                      onEditingComplete: () =>
                                          _focusStreet.requestFocus(),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        final cepApi = ApiCep();
                                        final resultado = await cepApi.buscarCEP(_controllerCep.text);
                                        print('Endereço: ${resultado['logradouro']}, ${resultado['bairro']}, ${resultado['localidade']} - ${resultado['uf']}');
                                        if (resultado['logradouro'] != null) {
                                          _controllerStreet.text = resultado['logradouro'];
                                          _controllerNeighborhood.text = resultado['bairro'];
                                          _controllerCity.text = resultado['localidade'];
                                        }
                                        else {
                                          _controllerStreet.clear();
                                          _controllerNeighborhood.clear();
                                          _controllerCity.clear();
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.purple.shade800,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        minimumSize: Size(200, 50),
                                      ),
                                      child: const Text(
                                        'Consultar CEP',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  //rua
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200)),
                                    ),
                                    child: TextFormField(
                                      focusNode: _focusStreet,
                                      controller: _controllerStreet,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        labelText: 'Rua',
                                      ),
                                      onEditingComplete: () =>
                                          _focusNeighborhood.requestFocus(),
                                    ),
                                  ),

                                  //bairro
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200)),
                                    ),
                                    child: TextFormField(
                                      focusNode: _focusNeighborhood,
                                      controller: _controllerNeighborhood,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        labelText: 'Bairro',
                                      ),
                                      onEditingComplete: () =>
                                          _focusNumber.requestFocus(),
                                    ),
                                  ),
                                  //numero
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200)),
                                    ),
                                    child: TextFormField(
                                      focusNode: _focusNumber,
                                      controller: _controllerNumber,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: 'Numero',
                                      ),
                                      onEditingComplete: () =>
                                          _focusCity.requestFocus(),
                                    ),
                                  ),
                                  //cidade
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200)),
                                    ),
                                    child: TextFormField(
                                      focusNode: _focusCity,
                                      controller: _controllerCity,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        labelText: 'Cidade',
                                      ),
                                      onEditingComplete: () =>
                                          _focusCity.requestFocus(),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (_key.currentState!.validate()) {
                                          final _status =
                                              await _authService.createAccount(
                                                  name: _controllerName.text
                                                      .trim(),
                                                  email: _controllerEmail.text,
                                                  password:
                                                      _controllerPassword.text);

                                          // Quando um cadastro for possivel, o usuario consegue entrar na pagina principal
                                          if (_status ==
                                              AuthStatus.successful) {
                                            cadastraUsuario();
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
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.purple.shade800,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        minimumSize: Size(240, 50),
                                      ),
                                      child: const Text(
                                        'Cadastrar',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(child: SizedBox(height: 20))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
