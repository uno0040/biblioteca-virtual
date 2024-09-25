// ignore_for_file: prefer_const_constructors

import 'package:application_muito_foda/Repositories/book_repository.dart';
import 'package:application_muito_foda/services/currentBook.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:application_muito_foda/Components/snakbar.dart';
import 'package:application_muito_foda/Pages/emprestimo.dart';
import 'package:application_muito_foda/Pages/userPages/background_wave.dart';
import 'package:application_muito_foda/Pages/userPages/lendBook.dart';
import 'package:application_muito_foda/Pages/userPages/sliverSearch_bar.dart';
import 'package:get/get.dart';

import '../../Objects/book_model.dart';


class Home extends StatefulWidget {
  static const String id = 'Home';

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LivrosSearchDelegate _livrosSearchDelegate = LivrosSearchDelegate();
  var categoria = "";
  List<String> listaDeLivros = [
    'Percy Jackson',
    'Crepúsculo',
    'Diário de um Banana',
    'It, a Coisa',
    'Sherlock Holmes',
    'Harry Potter',
    'Senhor dos Anéis'
  ];
  int quantidadeElementos = 20;

  @override
  Widget build(BuildContext context) {
    _livrosSearchDelegate.listaDeLivros = listaDeLivros;
    final bookRepo = Get.put(BookRepository());
    return FutureBuilder(future: bookRepo.allBookDetails(), builder: (context, snapshot){ 
            Widget newslistsliver;
            if (snapshot.connectionState == ConnectionState.done) {
              final books = snapshot.data as List<BookModel>;
              if (snapshot.hasData) {
               newslistsliver = SliverList(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (categoria == "") {
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
                                borderRadius: BorderRadius.circular(10)

                              ),
                              // Adicione outros estilos ou widgets conforme necessário
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // TITULO DO LIVRO VAI AQUI
                                books[index].title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                // AUTOR VAI AQUI
                                books[index].author,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w200
                                  ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20, // Tamanho pequeno
                                    color: Colors.orange.shade200, // Cor do ícone
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    // COLOCAR UMA VARIAVEL PARA PEGAR A CLASSIFICAÇÃO
                                    books[index].rating,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w200
                                    )
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 550,),
                         Row(
                            children: [
                              
                              GestureDetector(
                                onTap: () {
                                  // Lógica para o clique no ícone do livro
                                  print('Ícone do Livro Pressionado');
                                  CurrentBook.set(books[index].title);
                                  getind(books[index].title,books[index].author, books[index].condition, books[index].resenha);
                                  Navigator.pushNamed(context,Lendbook.id);
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
                                      Icons.book,
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
                  } 
                  else {
                    return Container(); // Retorna um contêiner vazio se exceder a quantidade desejada
                  }
                  } else {
                    if (index < books.length && books[index].category == categoria) {
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
                                borderRadius: BorderRadius.circular(10)

                              ),
                              // Adicione outros estilos ou widgets conforme necessário
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // TITULO DO LIVRO VAI AQUI
                                books[index].title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                // AUTOR VAI AQUI
                                books[index].author,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w200
                                  ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20, // Tamanho pequeno
                                    color: Colors.orange.shade200, // Cor do ícone
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    // COLOCAR UMA VARIAVEL PARA PEGAR A CLASSIFICAÇÃO
                                    books[index].rating,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w200
                                    )
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 550,),
                         Row(
                            children: [
                              
                              GestureDetector(
                                onTap: () {
                                  // Lógica para o clique no ícone do livro
                                  print('Ícone do Livro Pressionado');
                                  CurrentBook.set(books[index].title);
                                  getind(books[index].title,books[index].author, books[index].condition, books[index].resenha);
                                  Navigator.pushNamed(context,Lendbook.id);
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
                                      Icons.book,
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
                  } 
                  else {
                    return Container(); // Retorna um contêiner vazio se exceder a quantidade desejada
                  }
                  }
                },
                childCount: books.length, // +1 para o espaço do retângulo
            ),
          );
              } else if (snapshot.hasError) {
               newslistsliver = SliverToBoxAdapter(child: Text(snapshot.error.toString()),);
              } else {
                newslistsliver = SliverToBoxAdapter(child: Text("Algo deu errado ou a biblioteca se encontra vazia."),);
              }
            } else {
              newslistsliver = SliverToBoxAdapter(child: CircularProgressIndicator());
            }

            return CustomScrollView(
              slivers: <Widget>[
              SliverPersistentHeader(
                delegate: SliverSearchAppBar(),
                pinned: true,
              ),SliverToBoxAdapter(
                child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.white, // Cor de fundo do Row
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categorias',
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8), // Espaçamento entre o texto e os botões
                  _buildFilterButtons()
                ],
              ),
            ),
          ),
          newslistsliver],);
            },
          );
  }

 Widget _buildFilterButtons() {
    return Container(
      height: 50, // Ajuste a altura conforme necessário
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFilterButton('HQ\'s e Mangás'),
          _buildFilterButton('Autodesenvolvimento'),
          _buildFilterButton('Literatura e Ficção'),
          _buildFilterButton('Horror e Mistério'),
          _buildFilterButton('Religião e Espiritualidade'),
          _buildFilterButton('Política, Filosofia e Ciências Sociais'),
          _buildFilterButton('Policial'),
          _buildFilterButton('Infantil'),
          _buildFilterButton('Não Ficção'),
          _buildFilterButton('Didáticos e Educacionais'),
        ],
      ),
    );
  }
  // filtros , colocar a logica baseada no nome do botão 
  Widget _buildFilterButton(String label) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () {
          // Adicione a lógica de filtragem aqui
          // Por exemplo, você pode atualizar o estado ou realizar alguma ação
          
          if (categoria == label) {
            print('Filtro resetado!');
            categoria = "";
          } else {
            print('Filtrar por $label.');
            categoria = label;
          }
          setState(() {
            _HomeState();
          });
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple.shade200,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
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
