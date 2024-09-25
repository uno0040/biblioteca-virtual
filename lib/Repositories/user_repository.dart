import 'package:application_muito_foda/Objects/lend_model.dart';
import 'package:application_muito_foda/Objects/user_model.dart';
import 'package:application_muito_foda/Repositories/book_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Objects/book_model.dart';

  /// Antes de usar qualquer comando desta parte de banco de dados referencie esta classe.
  /// 
  /// i.e: final userRepo = Get.put(userRepository());
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  /// Insere o usuário no banco de dados.
  createUser(UserModel user) async {
    await _db.collection("Users").add(user.toJson()).
    whenComplete(
      () => Get.snackbar("Sucesso", "Conta criada com êxito.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.purple.withOpacity(0.1),
            // ignore: body_might_complete_normally_catch_error
            colorText: Colors.purple)).catchError((error, stackTrace) {
              Get.snackbar("Erro", "Algo deu errado. Tente novamente.",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.redAccent.withOpacity(0.1),
                colorText: Colors.red);
                debugPrint(error.toString());
              });
            }
  /// Esta função recebe um email e busca os dados do email cadastrado no banco de dados.
  /// 
  /// Retorna os dados do usuário.
  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db.collection("Users").where("email",isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }
  /// Esta função retorna os dados de todos os usuários cadastrados no banco de dados.
  Future<List<UserModel>> allUserDetails() async {
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  /// Função com a finalidade de atualizar os dados do usuário inserido.
  /// 
  /// Recebe os dados no formato UserModel.
  Future<void> updateUserData(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }

  /// Esta função implementa um emprestimo no usuario e no livro.
  Future<void> addLend(String email, String bookName, String start, String end) async {
    LendModel emprestimo = LendModel(bookName: bookName, startDate: start, endDate: end, status: "Active", admConf: "False");
    final user = await getUserDetails(email);
    await _db.collection("Users").doc(user.id).collection("Lends").add(emprestimo.toJson()).whenComplete(
      () => debugPrint("Empréstimo adicionado ao banco de dados com sucesso :)"));
    final bookRepo = Get.put(BookRepository());
    BookModel livro = await bookRepo.getBookDetails(bookName);
    await bookRepo.updateBookLendStatus(livro, "True");
  }
  
  Future<void> closeLend(String email, String id) async {
    final bookRepo = Get.put(BookRepository());
    final user = await getUserDetails(email);
    final lendDocRef = _db.collection("Users").doc(user.id).collection("Lends").doc(id);
    final lendDocSnapshot = await lendDocRef.get();
    if(lendDocSnapshot.exists) {
    final lendData = LendModel.fromSnapshot(lendDocSnapshot);

    LendModel newData = LendModel(bookName: lendData.bookName, startDate: lendData.startDate, endDate: lendData.endDate, status: "Done", admConf: "False");
    BookModel livro = await bookRepo.getBookDetails(newData.bookName);
    await bookRepo.updateBookLendStatus(livro, "False");
    await _db.collection("Users").doc(user.id).collection("Lends").doc(lendData.id).update(newData.toJson());
    }
    else {
      print("errou hein");
    }
  }

  Future<void> admConfirmation(String email, String id) async {
    final bookRepo = Get.put(BookRepository());
    final user = await getUserDetails(email);
    final lendDocRef = _db.collection("Users").doc(user.id).collection("Lends").doc(id);
    final lendDocSnapshot = await lendDocRef.get();
    if(lendDocSnapshot.exists) {
    final lendData = LendModel.fromSnapshot(lendDocSnapshot);

    LendModel newData = LendModel(bookName: lendData.bookName, startDate: lendData.startDate, endDate: lendData.endDate, status: "Done", admConf: "True");
    BookModel livro = await bookRepo.getBookDetails(newData.bookName);
    await bookRepo.updateBookLendStatus(livro, "False");
    await _db.collection("Users").doc(user.id).collection("Lends").doc(lendData.id).update(newData.toJson());
    }
    else {
      print("errou hein");
    }
  }

  Future<List<LendModel>> lendHistory(String email) async {
    final user = await getUserDetails(email);
    final snapshot = await _db.collection("Users").doc(user.id).collection("Lends").get();
    final lendHistory = snapshot.docs.map((e) => LendModel.fromSnapshot(e)).toList();
    return lendHistory;
  }
}

