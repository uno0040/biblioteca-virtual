// ignore_for_file: prefer_const_constructors

import 'package:application_muito_foda/Objects/book_model.dart';
import 'package:application_muito_foda/Objects/user_model.dart';
import 'package:application_muito_foda/Pages/main_admin_screen.dart';
import 'package:application_muito_foda/Repositories/book_repository.dart';
import 'package:application_muito_foda/Repositories/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:application_muito_foda/Objects/books.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../Components/snakbar.dart';



class CadastroPage extends StatefulWidget {
  static const String id = 'CadastroPageState'; // mudar o nome deste tanço

  const CadastroPage({Key? key}) : super(key: key);

  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  final List<BookObject> bookObjectList = [];
  final List<String> items = ['HQ\'s e Mangás',
                              'Autodesenvolvimento',
                              'Literatura e Ficção',
                              'Horror e Mistério',
                              'Religião e Espiritualidade',
                              'Política, Filosofia e Ciências Sociais',
                              'Policial',
                              'Infantil',
                              'Não Ficção',
                              'Didáticos e Educacionais'];
  var _controllerCategory = 'HQ\'s e Mangás';
  final TextEditingController _controllerTitle        = TextEditingController();
  final TextEditingController _controllerAuthor       = TextEditingController();
  final TextEditingController _controllerIllustrator  = TextEditingController();
  final TextEditingController _controllerCollection   = TextEditingController();
  final TextEditingController _controllerPublisher    = TextEditingController();
  final TextEditingController _controllerEdition      = TextEditingController();
  final TextEditingController _controllerVolume       = TextEditingController();
  final TextEditingController _controllerYear         = TextEditingController();
  final TextEditingController _controllerResenha      = TextEditingController();
  final TextEditingController _controllerCondition    = TextEditingController();
  final TextEditingController _controllerPosition     = TextEditingController();
  final TextEditingController _controllerPagesNumber  = TextEditingController();
  final TextEditingController _controllerRating       = TextEditingController();
  final TextEditingController _controllerLanguage     = TextEditingController();
  double ratin = 0.0;
  bool sucesso = false;
   final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              SizedBox(height: 20),
              Column(
                children: [
                  Text(
                    "Cadastro de livros",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold, 
                      color: Colors.black38
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Coloque as informações do livro que você deseja cadastrar",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold, 
                      color: Colors.deepPurple.shade200
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: _controllerTitle,
                focusNode: _focusNode,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.collections_bookmark_outlined,
                    color: Colors.deepPurple.shade200
                  ),
                  labelText: 'Titulo',
                  labelStyle: TextStyle(color: Colors.deepPurple.shade200),
                  
                ),
                // Validação de entrada, checar a entrada do input de nome
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira um título.";
                  }
                  // TEM QUE COLOCAR UMA CONDIÇÃO DE CHECAR SE O NOME JÁ EXISTE NO BANCO DE DADOS
                },
              ),

              SizedBox(height: 15),
              TextFormField(
                controller: _controllerAuthor,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Autor",
                  labelStyle: TextStyle(color: Colors.deepPurple.shade200),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.deepPurple.shade200,
                    ),
                ),
                // validação de entrada, checar a entrada do input de nome
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira o autor.";
                  }
                  // TEM QUER COLOCAR UMA CONDIÇÃO DE CHECAR SE O NOME JA EXISTE NO BANCO DE DADOS
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: _controllerIllustrator, // input
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Ilustrador",
                  labelStyle: TextStyle(color: Colors.deepPurple.shade200),
                  prefixIcon:  Icon(Icons.architecture, color: Colors.deepPurple.shade200),
                ),
                // validação de entrada, checar a entrada do input de nome
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira o ilustrador.";
                  }
                  // TEM QUER COLOCAR UMA CONDIÇÃO DE CHECAR SE O NOME JA EXISTE NO BANCO DE DADOS
                },
              ),
              SizedBox(height: 30),
              // MUDAR A FIELD DA DATA
              TextFormField(
                controller: _controllerCollection,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Coleção",
                  labelStyle: TextStyle(color: Colors.deepPurple.shade200),
                  prefixIcon: Icon(Icons.collections_bookmark_rounded,color: Colors.deepPurple.shade200),
                ),
                // validação de entrada, checar a entrada do input de nome
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira a coleção.";
                  }
                  // TEM QUER COLOCAR UMA CONDIÇÃO DE CHECAR SE O NOME JA EXISTE NO BANCO DE DADOS
                },
              ),
              SizedBox(
                height: 30,
              ),
              //MUDAR O FIELD DA SENHA
              TextFormField(
                controller: _controllerPublisher,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Editora",
                  labelStyle: TextStyle(color: Colors.deepPurple.shade200),
                  prefixIcon: Icon(Icons.public_sharp,color: Colors.deepPurple.shade200),
                ),
                // validação de entrada, checar a entrada do input de nome
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira a editora.";
                  }
                  // TEM QUER COLOCAR UMA CONDIÇÃO DE CHECAR SE O NOME JA EXISTE NO BANCO DE DADOS
                },
              ),
              SizedBox(
                height: 30,
              ),
              //MUDAR O FIELD DA SENHA
              TextFormField(
                controller: _controllerEdition,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Edição",
                  labelStyle: TextStyle(color: Colors.deepPurple.shade200),
                  prefixIcon:  Icon(Icons.library_books,color: Colors.deepPurple.shade200),
                ),
                // validação de entrada, checar a entrada do input de nome
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira a edição.";
                  }
                  // TEM QUER COLOCAR UMA CONDIÇÃO DE CHECAR SE O NOME JA EXISTE NO BANCO DE DADOS
                },
              ),
              SizedBox(
                height: 30,
              ),
              //MUDAR O FIELD DA SENHA
              TextFormField(
                controller: _controllerVolume,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Volume",
                  labelStyle: TextStyle(color: Colors.deepPurple.shade200),
                  prefixIcon:  Icon(Icons.view_column_outlined,color: Colors.deepPurple.shade200),
                ),
                // validação de entrada, checar a entrada do input de nome
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira o volume.";
                  }
                  // TEM QUER COLOCAR UMA CONDIÇÃO DE CHECAR SE O NOME JA EXISTE NO BANCO DE DADOS
                },
              ),
              SizedBox(
                height: 30,
              ),
              //MUDAR O FIELD DA SENHA
              TextFormField(
                controller: _controllerYear,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Ano",
                  labelStyle: TextStyle(color: Colors.deepPurple.shade200),
                  prefixIcon: Icon(Icons.calendar_month_outlined,color: Colors.deepPurple.shade200),
                ),
                // validação de entrada, checar a entrada do input de nome
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira o ano do livro.";
                  }
                  // TEM QUER COLOCAR UMA CONDIÇÃO DE CHECAR SE O NOME JA EXISTE NO BANCO DE DADOS
                },
              ),
              SizedBox(
                height: 30,
              ),
              //MUDAR O FIELD DA SENHA
              TextFormField(
                controller: _controllerResenha,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Resenha",
                  labelStyle: TextStyle(color: Colors.deepPurple.shade200),
                  prefixIcon: Icon(Icons.article,color: Colors.deepPurple.shade200),
                ),
                // validação de entrada, checar a entrada do input de nome
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira a resenha do livro.";
                  }
                  // TEM QUER COLOCAR UMA CONDIÇÃO DE CHECAR SE O NOME JA EXISTE NO BANCO DE DADOS
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _controllerCondition,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Condição",
                  labelStyle: TextStyle(color: Colors.deepPurple.shade200),
                  prefixIcon:  Icon(Icons.menu_book_outlined,color: Colors.deepPurple.shade200),
                ),
                // validação de entrada, checar a entrada do input de nome
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira a condição do livro.";
                  }
                  // TEM QUER COLOCAR UMA CONDIÇÃO DE CHECAR SE O NOME JA EXISTE NO BANCO DE DADOS
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _controllerPosition,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Prateleira",
                  labelStyle: TextStyle(color: Colors.deepPurple.shade200),
                  prefixIcon:  Icon(Icons.shelves,color: Colors.deepPurple.shade200),
                ),
                // validação de entrada, checar a entrada do input de nome
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira a posição do livro.";
                  }
                  // TEM QUER COLOCAR UMA CONDIÇÃO DE CHECAR SE O NOME JA EXISTE NO BANCO DE DADOS
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _controllerPagesNumber,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Número de páginas",
                  labelStyle: TextStyle(color: Colors.deepPurple.shade200),
                  prefixIcon:  Icon(Icons.find_in_page_rounded,color: Colors.deepPurple.shade200),
                ),
                // validação de entrada, checar a entrada do input de nome
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira o número de páginas.";
                  }
                  // TEM QUER COLOCAR UMA CONDIÇÃO DE CHECAR SE O NOME JA EXISTE NO BANCO DE DADOS
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _controllerRating,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Classificação",
                  labelStyle: TextStyle(color: Colors.deepPurple.shade200),
                  prefixIcon: Icon(Icons.star_border_purple500_outlined,color: Colors.deepPurple.shade200),
                ),
                // validação de entrada, checar a entrada do input de nome
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira a classificação do livro.";
                  }
                  // TEM QUER COLOCAR UMA CONDIÇÃO DE CHECAR SE O NOME JA EXISTE NO BANCO DE DADOS
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _controllerLanguage,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Língua",
                  labelStyle: TextStyle(color: Colors.deepPurple.shade200),
                  prefixIcon:  Icon(Icons.language_rounded,color: Colors.deepPurple.shade200),
                ),
                // validação de entrada, checar a entrada do input de nome
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor insira a língua do livro.";
                  }
                  // TEM QUER COLOCAR UMA CONDIÇÃO DE CHECAR SE O NOME JA EXISTE NO BANCO DE DADOS
                },
              ),
              
              SizedBox(
                height: 30,
              ),
              DropdownButton(
                value: _controllerCategory,
                items: items.map((item) => DropdownMenuItem<String>(value: item, child: Text(item))).toList(),
                onChanged: (item) => setState(() => _controllerCategory = item!),
                isExpanded: true,
                style: TextStyle(
                  color: Colors.deepPurple.shade200
                ),
              ),
              
              /*
              SizedBox(height: 30),
              Text(
                "Insira a condição do livro",
              ),
              RatingBar.builder(
                initialRating: rating,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {
                  setState(() {
                    rating = value;
                  });
                },
              ),*/

              SizedBox(
                height: 30,
              ),
              // COLOCAR UM DISABLE CASO OS DADOS NÃO TENHAM SIDO PREENCHIDOS
              ElevatedButton(
                  onPressed: () {
                    if (_controllerTitle.text.isEmpty ||
                      _controllerAuthor.text.isEmpty ||
                      _controllerIllustrator.text.isEmpty ||
                      _controllerCollection.text.isEmpty ||
                      _controllerPublisher.text.isEmpty ||
                      _controllerEdition.text.isEmpty ||
                      _controllerVolume.text.isEmpty ||
                      _controllerYear.text.isEmpty ||
                      _controllerResenha.text.isEmpty ||
                      _controllerCondition.text.isEmpty ||
                      _controllerPagesNumber.text.isEmpty ||
                      _controllerRating.text.isEmpty ||
                      _controllerLanguage.text.isEmpty ||
                      _controllerCategory.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Informações faltando'),
                            content: Text(
                                'Você deve preencher todos os campos primeiro.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // Fechar o diálogo
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      cadastraLivro();
                      //Navigator.of(context).pop();
                      Navigator.pushNamed(context, Admin_screen.id);
                      CustomSnackBar.showSuccessSnackBar(context,
                          message: 'Voce cadastrou um livro com sucesso');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple.shade400,  // Cor de fundo do botão
                    minimumSize: Size(250, 90),  // Largura e altura do botão
                  ),
                  
                  child: Text("Cadastrar",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                    
                  )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> cadastraLivro() async {
    String        title = _controllerTitle.text;
    String       author = _controllerAuthor.text;
    String  illustrator = _controllerIllustrator.text;
    String   collection = _controllerCollection.text;
    String    publisher = _controllerPublisher.text;
    String      edition = _controllerEdition.text;
    String       volume = _controllerVolume.text;
    String         year = _controllerYear.text;
    String      resenha = _controllerResenha.text;
    String    condition = _controllerCondition.text;
    String     position = _controllerPosition.text;
    String   pageNumber = _controllerPagesNumber.text;
    String       rating = _controllerRating.text;
    String     language = _controllerLanguage.text;
    String     category = _controllerCategory;

    // chamada a BookRepository, onde o código do banco de dados esta implementado.
    final bookRepo = Get.put(BookRepository());

    if (title.isNotEmpty        &&
        author.isNotEmpty       &&
        illustrator.isNotEmpty  &&
        collection.isNotEmpty   &&
        publisher.isNotEmpty    &&
        edition.isNotEmpty      &&
        volume.isNotEmpty       &&
        year.isNotEmpty         &&
        resenha.isNotEmpty      &&
        condition.isNotEmpty    &&
        position.isNotEmpty) {

      // BookModel usado para inserção no banco de dados
      // 
      BookModel novoLivro = BookModel(
                title       : title, 
                author      : author, 
                illustrator : illustrator, 
                collection  : collection, 
                publisher   : publisher, 
                edition     : edition, 
                volume      : volume, 
                year        : year, 
                resenha     : resenha,
                lendFlag    : "False",
                condition   : condition,
                position    : position,
                pageNumber  : pageNumber,
                rating      : rating,
                language    : language,
                category    : category, 
                );


      BookObject newBook = BookObject(
        title: title,
        author: author,
        illustrator: illustrator,
        collection: collection,
        publisher: publisher,
        edition: edition,
        volume: volume,
        year: year,
        resenha: resenha,
        rating: ratin,
      );
      await bookRepo.addBook(novoLivro);
      setState(() {
        bookObjectList.add(newBook);
      });
      // Limpar os campos após o cadastro
      _controllerTitle.clear();
      _controllerAuthor.clear();
      _controllerIllustrator.clear();
      _controllerCollection.clear();
      _controllerPublisher.clear();
      _controllerEdition.clear();
      _controllerVolume.clear();
      _controllerYear.clear();
      _controllerResenha.clear();
      _controllerCondition.clear();
      _controllerPagesNumber.clear();
      _controllerRating.clear();
      _controllerLanguage.clear();

      // Exibir um diálogo de sucesso
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Cadastro bem-sucedido'),
            content: Text('Seu livro foi cadastrado com sucesso.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // Fechar o diálogo
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        sucesso = false;
      });
    }
  }
}
