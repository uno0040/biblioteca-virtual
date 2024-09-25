import 'package:application_muito_foda/Objects/book_model.dart';
import 'package:application_muito_foda/Objects/lend_model.dart';
import 'package:application_muito_foda/Repositories/book_repository.dart';
import 'package:application_muito_foda/Repositories/user_repository.dart';
import 'package:application_muito_foda/services/currentBook.dart';
import 'package:application_muito_foda/services/currentEmail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserHistoric extends StatefulWidget {
  static const String id = 'userHistoric';

  const UserHistoric({Key? key}) : super(key: key);

  @override
  userHistoric_State createState() => userHistoric_State();
}

class userHistoric_State extends State<UserHistoric> {
  List<String> listaDeStrings = ["Livro 1", "Livro 2", "Livro 3"];
  bool dataSelect = false;
  Map<String, String> subtitulos = {
    "Livro 1": "Autor 1",
    "Livro 2": "Autor 2",
    "Livro 3": "Autor 3",
  };
  DateTime dataExemplo = DateTime.now();
  Map<String, DateTime?> datasSelecionadas = {};
  Map<String, bool> doneButtonPressed = {};

  @override
  Widget build(BuildContext context) {
    final userRepo = Get.put(UserRepository());
    final bookRepo = Get.put(BookRepository());
    return FutureBuilder(future: userRepo.lendHistory(CurrentEmail.get()), builder: (context,snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final historico = snapshot.data as List<LendModel>;
        if (snapshot.hasData) {
          return ListView.builder(
      itemCount: historico.length,
      itemBuilder: (context, index) {
        return FutureBuilder(future: bookRepo.getBookDetails(historico[index].bookName), builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            var idAtual = "1";
            idAtual = historico[index].id!; // id atual usado para alterar status do emprestimo
            var statusEmprestimo = historico[index].status;
            if (statusEmprestimo == "Active") {
              statusEmprestimo = "";
            }
            else {
              statusEmprestimo = "- Finalizado";
            }
            if (snapshot.hasData) {
              final dadosLivro = snapshot.data as BookModel;
              return ExpansionTile(
          title: Row(
            children: [
              Text("${dadosLivro.title} ${statusEmprestimo}",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 10), // Espaçamento entre o título e os botões
            ],
          ),
          subtitle: Text(
              dadosLivro.author), // Subtítulo dinâmico
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: dataExemplo,
                      lastDate: dataExemplo.add(Duration(days: 7)),
                    );

                    // Atualize o texto do botão com a data selecionada.
                    setState(() {
                      if (selectedDate != null) {
                        datasSelecionadas[listaDeStrings[index]] = selectedDate;
                        doneButtonPressed[listaDeStrings[index]] = true;
                        dataSelect = true;
                      }
                    });
                  },
                  child: Text(
                    datasSelecionadas[listaDeStrings[index]] != null
                        ? DateFormat('dd/MM/yyyy')
                            .format(datasSelecionadas[listaDeStrings[index]]!)
                        : "Selecionar Data",
                  ),
                ),
                IconButton(
                  onPressed: () async{
                    // Alternar entre cinza e verde ao pressionar 'done'.
                    print("id atual:");
                    print(idAtual);
                    userRepo.closeLend(CurrentEmail.get(),idAtual).whenComplete(() => print("closeLend executado."));
                    
                    setState(() {
                      userHistoric_State();
                      dataSelect = false;
                    });
                  },
                  icon: Icon(Icons.done,
                      color: dataSelect ?? false
                          ? Colors.blue
                          : Colors.grey),
                ),
              ],
            ),
          ],
        );
      
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()),);
            } else {
              return Center(child: Text("Algo deu errado."),);
            }
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        });
        },
    );
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()),);
        } else {
          return Center(child: Text("Algo deu erro..."),);
        }
      } else {
        return Center(child: CircularProgressIndicator(),);
      }
    
    }
    );
    }
}