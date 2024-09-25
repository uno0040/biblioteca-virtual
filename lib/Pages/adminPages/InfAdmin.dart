// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:application_muito_foda/Objects/book_model.dart';
import 'package:application_muito_foda/Pages/adminPages/sliverSear.dart';

import 'package:application_muito_foda/Repositories/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class InfAdmin extends StatefulWidget {
  static const String id = 'infAdmin';

  const InfAdmin({Key? key}) : super(key: key);

  @override
  InfAdmin_State createState() => InfAdmin_State();
}

class InfAdmin_State extends State<InfAdmin> {
  LivrosSearchDelegate _livrosSearchDelegate = LivrosSearchDelegate();
  List<String> listaDeLivros = [
    'Percy Jackson',
    'Crepúsculo',
    'Diário de um Banana',
    'It, a Coisa',
    'Sherlock Holmes',
    'Harry Potter',
    'Senhor dos Anéis'
  ];
  @override
   @override
  Widget build(BuildContext context) {
    _livrosSearchDelegate.listaDeLivros = listaDeLivros;
    final bookRepo = Get.put(BookRepository());

    return FutureBuilder(
      future: bookRepo.allBookDetails(),
      builder: (context, snapshot) {
        Widget newslistsliver;
        if (snapshot.connectionState == ConnectionState.done) {
          final books = snapshot.data as List<BookModel>;
          if (snapshot.hasData) {
            newslistsliver = SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index < books.length) {
                    return Container(
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // Add other styles or widgets as needed
                            ),
                          ),
                          SizedBox(width: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Titulo: ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  )
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    // BOOK TITLE GOES HERE
                                    books[index].title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text('Autor: ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  )
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    // AUTHOR GOES HERE
                                    books[index].author,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text('Ilustrador: ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  )
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    books[index].illustrator,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text('Coleção: ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  )
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    books[index].collection,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text('Edição: ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  )
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    books[index].edition,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text('Volume: ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  )
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    books[index].volume,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text('Ano: ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  )
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    books[index].year,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text('Condição: ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  )
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    books[index].condition,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text('Posição: ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  )
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    books[index].position,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Logic for the click on the book icon
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.deepPurple.shade200,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.deepPurple.shade200,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
                childCount: books.length,
              ),
            );
          } else if (snapshot.hasError) {
            newslistsliver =
                SliverToBoxAdapter(child: Text(snapshot.error.toString()));
          } else {
            newslistsliver = SliverToBoxAdapter(
              child: Text("Something went wrong or the library is empty."),
            );
          }
        } else {
          newslistsliver = SliverToBoxAdapter(child: CircularProgressIndicator());
        }

        return CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: SliverSearchAppBar(),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aqui estão os seus livros já cadastrados!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            newslistsliver,
          ],
        );
      },
    );
  }
}


class LivrosSearchDelegate extends SearchDelegate<String> {
  List<String> listaDeLivros = [];

  LivrosSearchDelegate({List<String>? livros}) : listaDeLivros = livros ?? [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: buildSearchResults(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: buildSearchResults(),
    );
  }

  List<Widget> buildSearchResults() {
    return listaDeLivros
        .where((livro) => livro.toLowerCase().contains(query.toLowerCase()))
        .take(5) // limite para os 5 primeiros resultados
        .map((livro) {
      return ListTile(
        title: Text(livro),
        // Adicione mais informações do livro conforme necessário
      );
    }).toList();
  }
}
