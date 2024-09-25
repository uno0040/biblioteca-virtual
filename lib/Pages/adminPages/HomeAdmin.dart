// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import '/Pages/userPages/detailsUser.dart';

import '../userPages/detailsUser.dart';
import '/Objects/user_model.dart';
import '/Repositories/user_repository.dart';
import '/Pages/adminPages/sliverSearch_barAdm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAdmin extends StatefulWidget {
  static const String id = 'HomeAdmin';

  const HomeAdmin({Key? key}) : super(key: key);

  @override
  HomeAdmin_State createState() => HomeAdmin_State();
}

class HomeAdmin_State extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    final userRepo = Get.put(UserRepository());
    return FutureBuilder(
      future: userRepo.allUserDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final users = snapshot.data as List<UserModel>;
          if (snapshot.hasData) {
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    delegate: SliverSearchAppBar(),
                    pinned: true,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        if (index < users.length) {
                          List<List<String>> historicoLivros = [
                            ['Livro1', 'Livro 2', 'livro 3'],
                            ['Livro45', 'livro 56'],
                            ['livro 5', 'livro 20'],
                            ['livro 47'],
                            ['livro 123'],
                            ['livro 1'],
                            ['Livro 13'],
                            ['Livro 444'],
                            ['Livro 12']
                          ];

                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, DetailsUser.id,
                                  arguments: users[index].email);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 150,
                                    width: 100,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurple.shade200,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.person,
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        users[index].name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Histórico de Livros:',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black26,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: historicoLivros[index]
                                            .map(
                                              (livro) => Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    livro,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      color:
                                                          Colors.grey.shade800,
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                ],
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                      childCount: users.length,
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
      },
    );
  }
}