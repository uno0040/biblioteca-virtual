import 'package:application_muito_foda/Objects/lend_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Objects/book_model.dart';

  /// Antes de usar qualquer comando desta parte de banco de dados referencie esta classe.
  /// 
  /// i.e: final bookRepo = Get.put(BookRepository());
class BookRepository extends GetxController {
  static BookRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  /// Adiciona o livro no firestore
  addBook(BookModel book) async {
    await _db.collection("Books").add(book.toJson()).
    whenComplete(
      () => Get.snackbar("Sucesso", "Livro adicionado com sucesso.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.purple.withOpacity(0.1),
            colorText: Colors.purple)).catchError((error, stackTrace) {
              Get.snackbar("Erro", "Algo deu errado. Tente novamente.",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.redAccent.withOpacity(0.1),
                colorText: Colors.red);
                print(error.toString());
              });
            }
  
  /// Esta função recebe o nome do livro o qual deseja buscar os dados.
  /// 
  /// Retorna todos os dados do livro no formato BookModel.
  Future<BookModel> getBookDetails(String title) async {
    final snapshot = await _db.collection("Books").where("title",isEqualTo: title).get();
    final bookData = snapshot.docs.map((e) => BookModel.fromSnapshot(e)).single;
    return bookData;
  }
  /// Esta função recebe o nome do livro o qual deseja buscar os dados.
  /// 
  /// Retorna todos os dados do livro no formato BookModel.
  Future<BookModel> getBookDetailsID(String id) async {
    final snapshot = await _db.collection("Books").where("id",isEqualTo: id).get();
    final bookData = snapshot.docs.map((e) => BookModel.fromSnapshot(e)).single;
    return bookData;
  }
  /// Esta função retorna todos os livros cadastrados no formato Future<List<BookModel>>
  Future<List<BookModel>> allBookDetails() async {
    final snapshot = await _db.collection("Books").get();
    final bookData = snapshot.docs.map((e) => BookModel.fromSnapshot(e)).toList();
    return bookData;
  }
/*
  /// Esta função recebe o nome do livro e retorna o ID dele no Firestore.
  Future<String> GetBookID(String name) {
    final snapshot = await _db.collection("Books").where('name',isEqualTo: name).get();
    final id = snapshot.docs.map((e) => null)
  }
*/
  /// Esta função atualiza os dados do livro fazendo a busca pelo id atribuído pelo
  /// Firestore.
  /// 
  /// Recebe o livro no formato BookModel.
  Future<void> updateBookData(BookModel book) async {
    await _db.collection("Books").doc(book.id).update(book.toJson());
  }
  Future<void> updateBookLendStatus(BookModel book, String newlendFlag) async {
    var livro = await book.setLendFlag(newlendFlag);
    await _db.collection("Books").doc(book.id).update(livro);
  }

}

