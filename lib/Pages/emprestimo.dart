// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:application_muito_foda/Pages/info_livro.dart';

class EmprestimoPage extends StatefulWidget {
  static const String id = 'EmprestimoPage'; // mudar o nome deste tanço

  const EmprestimoPage({Key? key}) : super(key: key);

  @override
  EmprestimoPageState createState() => EmprestimoPageState();
}

class EmprestimoPageState extends State<EmprestimoPage> {
  List<String> listaDeLivros = [
    'Percy Jackson',
    'Crepúsculo',
    'Diário de um Banana',
    'It, a Coisa',
    'Sherlock Holmes',
    'Harry Potter',
    'Senhor dos Anéis'
  ];

  LivrosSearchDelegate _livrosSearchDelegate = LivrosSearchDelegate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Empréstimo de Livros"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: _livrosSearchDelegate,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listaDeLivros.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listaDeLivros[index]),
            onTap: () {
              _navigateToInfoLivro(listaDeLivros[index]);
            },
          );
        },
      ),
    );
  }

  void _navigateToInfoLivro(String livro) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InfoLivroPage(livro: livro),
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
