// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:application_muito_foda/Repositories/book_repository.dart';
import 'package:application_muito_foda/Repositories/user_repository.dart';
import 'package:application_muito_foda/services/currentBook.dart';
import 'package:application_muito_foda/services/currentEmail.dart';
import 'package:flutter/material.dart';
import 'package:application_muito_foda/Pages/userPages/home.dart';
import 'package:get/get.dart';

import '../../Objects/book_model.dart';
List<String>  inf = [];
class Lendbook extends StatefulWidget {
  static const String id = 'Lendbook';


  const Lendbook({Key? key}) : super(key: key);
  @override
  Lendbook_State createState() => Lendbook_State();
}

class Lendbook_State extends State<Lendbook> {

  double containerWidth = 190;
  double containerHeight = 280;

  double containerWidthinf = 350;
  double containerHeightinf = 80;

    double containerWidthres = 450;
  double containerHeighres= 320;

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2023,11,23),
    end: DateTime(2023,12,27)
  );


  

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final bookRepo = Get.put(BookRepository());
    return Scaffold(
      body: FutureBuilder(
        future: bookRepo.getBookDetails(CurrentBook.get()), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final book = snapshot.data as BookModel;
              return Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.deepPurple.shade200, Colors.pink.shade50],
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // titulo do livro 
                Text(
                  book.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                // autor do livro 
                Text(
                  book.author,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),

          // Imagem do livro 
         Positioned(
            top: 120,
            left: (MediaQuery.of(context).size.width - containerWidth) / 2,
            width: containerWidth,
            height: containerHeight,
            child: Container(
              width: containerWidth,
              height: containerHeight,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ]
              ),
              
            ),
          ),
          Positioned(
            top: 460,
            left: (MediaQuery.of(context).size.width - containerWidthinf)/2,
            width: containerWidthinf,
            height: containerHeightinf,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ]

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber.shade200
                            ),
                          SizedBox(width: 5,),
                          // Valor da avaliação vai aqui 
                          Text(
                            book.rating,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 10,),
                      Text(
                        'Avaliações',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 15,),
                      Text(
                        // O numero de paginas do livro vem aqui
                        book.pageNumber,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Páginas',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 15,),
                      Text(
                        // A variavel do idioma vem aqui, utilizar 3 caracteres para descrever o idimo
                        // SE NÃO TU QUEBRA O CODIGO CARAIO
                        book.language,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Idioma',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 15,),
                      Text(
                        book.condition,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        ),
                      SizedBox(height: 10,),
                      Text(
                        'Condição',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold
                        ),
                        )
                    ],
                  )
                ],
              ),
            ),
          ),
         Positioned(
            top: 530,
            left: 16,
            right: 16,
            child: Container(
              height: containerHeighres,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25,top: 16), // Adicione este padding à esquerda
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinha à esquerda
                  children: [
                    Text(
                      'Resenha', 
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.bold
                        )
                      ),
                      SizedBox(height: 5,),
                      Text(
                        book.resenha,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                          color: Colors.black54
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Defina a data de emprestismo:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold
                        )
                      )
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 70,
            left: 16,
            right: 16,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: pickDateRange,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple.shade300, // Cor do botão
                  ),
                  child: Text('${start.day}/${start.month}/${start.year}'),
                ),
                ElevatedButton(
                  onPressed: pickDateRange,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple.shade300, // Cor do botão
                  ),
                  child: Text('${end.day}/${end.month}/${end.year}'),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 50,
            right: 50,
            child: ElevatedButton(
              onPressed: () async {
                final userRepo = await Get.put(UserRepository());
                userRepo.addLend(CurrentEmail.get(), CurrentBook.get(), start.toString(), end.toString()).whenComplete(() => print("Emprestimo adicionado com sucesso :DDDD"));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple.shade300,
                 minimumSize: Size(double.infinity, 50)
              ),
              child: Text('Emprestar'),
            ),
          ),
        ],
      );
            } else if (snapshot.hasError) {
              return Center(child : Text(snapshot.error.toString()));
            } else {
              return Center(child : Text("Algo deu errado..."));
            }
          } else {
            return Center(child: CircularProgressIndicator(),); 
          }
      },
    ),
    );
  
  }
  Future pickDateRange() async{
  DateTimeRange? newDateRange = await showDateRangePicker(
    context: context, 
    initialDateRange: dateRange,
    firstDate: DateTime(2023),
    lastDate: DateTime(2024),
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }

}

void getind(titulo,autor,cond,resenha,){
  inf.add(titulo);
  inf.add(autor);
  inf.add(cond);
  inf.add(resenha);
}


