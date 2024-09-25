// details_user.dart

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/user.dart';
import '/Objects/user_model.dart';
import '/Repositories/user_repository.dart';

class DetailsUser extends StatefulWidget {
  static const String id = 'detailUser';
  final String userEmail;

  const DetailsUser({Key? key, required this.userEmail}) : super(key: key);

  @override
  DetailsUser_State createState() => DetailsUser_State();
}

class DetailsUser_State extends State<DetailsUser> {
  late String userEmail;

  @override
  void initState() {
    super.initState();
    // Inicialize a variável userEmail no initState
    userEmail = widget.userEmail;
  }

  Widget build(BuildContext context) {
    List<List<String>> HistoricoLivro = [
      ['livro 3', '1/12/2023', '12/12/2023', 'true', 'false'], // emprestado
      ['livro 2', '15/11/2023', '07/12/2023', 'true', 'false'], // emprestado
      ['livro 6', '05/12/2023', '20/12/2023', 'true', 'false'], // emprestado
      ['livro 78', '1/12/2023', '07/12/2023', 'false', 'false'], // pendente
      ['livro 51', '15/11/2023', '07/12/2023', 'false', 'false'], // pendente
      ['livro 57', '1/11/2023', '1/12/2023', 'true', 'true'], // finalizado
      ['livro 17', '15/08/2023', '20/08/2023', 'true', 'true'], // finalizado
      ['livro 80', '20/08/2023', '05/12/2023', 'true', 'false'], // atrasado
      ['livro 14', '20/08/2023', '05/12/2023', 'true', 'false'], // atrasado
    ];
    final userRepo = Get.put(UserRepository());
    return FutureBuilder(
        future: userRepo.getUserDetails(userEmail),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final users = snapshot.data as UserModel;
            if (snapshot.hasData) {
              return Scaffold(
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 200.0,
                      floating: false,
                      pinned: true,
                      backgroundColor: Colors.grey[100],
                      flexibleSpace: FlexibleSpaceBar(
                        background: Row(
                          children: [
                            SizedBox(width: 25),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepPurple.shade200,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Icon(
                                  Icons.person,
                                  size: 100,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 50),
                            Text(
                              users.name,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple.shade200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(width: 16),
                                  Text(
                                    'Informações do Usuário',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black26,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          SizedBox(width: 25),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Email',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black26,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                users.email,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black38,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 130),
                                          Column(
                                            children: [
                                              Text(
                                                'Endereço',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black26,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  SizedBox(width: 100),
                                                  Text(
                                                    '${users.street}, ${users.neighborhood}, ${users.number}, ${users.city}',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black38,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 130),
                                          Column(
                                            children: [
                                              Text(
                                                'Telefone: ',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black26,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  SizedBox(width: 90),
                                                  Text(
                                                    users.phone,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black38,
                                                    ),
                                                  ),
                                                  SizedBox(width: 30),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          Colors.green.shade300,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                        Icons.phone,
                                                        size: 16,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              _buildFilterButtons(HistoricoLivro),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: (Text(snapshot.error.toString())),
              );
            } else {
              return Center(
                child: Text("Algo deu errado."),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _buildFilterButtons(HistoricoLivro) {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFilterButton('Empréstimos ativos', HistoricoLivro),
          _buildFilterButton('Empréstimos Retornados', HistoricoLivro),
          _buildFilterButton('Empréstimos Finalizados', HistoricoLivro),
          _buildFilterButton('Empréstimos Atrasados', HistoricoLivro),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label, List<List<String>> historicoLivro) {
    List<String> itensDropdown = [];
    Color buttonColor = Colors.deepPurple.shade200; // Cor padrão para o botão

    // Filtra os itens com base na categoria
    if (label == 'Empréstimos ativos') {
      for (var livro in historicoLivro) {
        if (livro[2] != '05/12/2023' &&
            livro[3] == 'true' &&
            livro[4] == 'false') {
          itensDropdown.add(livro[0]);
        }
      }
    } else if (label == 'Empréstimos Retornados') {
      for (var livro in historicoLivro) {
        if (livro[3] == 'false' && livro[4] == 'false') {
          itensDropdown.add(livro[0]);
        }
      }
      buttonColor = Colors.blue; // Cor para retornados
    } else if (label == 'Empréstimos Finalizados') {
      for (var livro in historicoLivro) {
        if (livro[3] == 'true' && livro[4] == 'true') {
          itensDropdown.add(livro[0]);
        }
      }
      buttonColor = Colors.green; // Cor para finalizados
    } else if (label == 'Empréstimos Atrasados') {
      for (var livro in historicoLivro) {
        if (livro[2] == '05/12/2023' &&
            livro[3] == 'true' &&
            livro[4] == 'false') {
          itensDropdown.add(livro[0]);
        }
      }
      buttonColor = Colors.red; // Cor para atrasados
    }

    return Container(
      margin: EdgeInsets.only(right: 8),
      child: DropdownButton<String>(
        onChanged: (String? livroSelecionado) {
          if (livroSelecionado != null) {
            print('Filtrar por $label: $livroSelecionado');
          }
        },
        items: itensDropdown.map((String livro) {
          Color itemColor = _getItemColor(label); // Cor do item dinâmica
          return DropdownMenuItem<String>(
            value: livro,
            child: Text(
              livro,
              style: TextStyle(color: itemColor),
            ),
          );
        }).toList(),
        hint: Text(
          label,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        icon: Icon(
          Icons.arrow_drop_down,
          color: buttonColor,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: buttonColor),
        underline: Container(
          height: 2,
          color: buttonColor,
        ),
        dropdownColor: Colors.grey[200], // Cor dos itens do dropdown
      ),
    );
  }

  // Função para obter a cor do item com base na categoria
  Color _getItemColor(String label) {
    if (label == 'Empréstimos ativos') {
      return Colors.deepPurple; // Cor para ativos
    } else if (label == 'Empréstimos Retornados') {
      return Colors.blue; // Cor para retornados
    } else if (label == 'Empréstimos Finalizados') {
      return Colors.green; // Cor para finalizados
    } else if (label == 'Empréstimos Atrasados') {
      return Colors.red; // Cor para atrasados
    }
    return Colors.black; // Cor padrão
  }
}