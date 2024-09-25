//tela para mostrar as informações do livro quando o usuário for fazer o empréstimo
//tem que esperar o banco de dados ser implementado

import 'package:flutter/material.dart';

class InfoLivroPage extends StatelessWidget {
  final String livro;

  const InfoLivroPage({Key? key, required this.livro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Aqui você pode usar as informações do livro para exibi-las na página
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações do Livro"),
      ),
      body: Center(
        child: Text("Detalhes do livro: $livro"),
      ),
    );
  }
}
