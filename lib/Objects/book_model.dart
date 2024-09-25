import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class BookModel {
  final String? id;
  final String title;
  final String author;
  final String illustrator;
  final String collection;
  final String publisher;
  final String edition;
  final String volume;
  final String year;
  final String resenha;
  final String lendFlag;
  final String condition;
  final String position;
  final String pageNumber;
  final String rating;
  final String language;
  final String category;
  // SE ALGUMA MUDANÇA FOR FEITA AQUI, APAGAR TODOS OS OUTROS DADOS DO BANCO DE DADOS SE NAO VAI DAR ERRO!!
  const BookModel({
    this.id,
    required this.title,
    required this.author,
    required this.illustrator,
    required this.collection,
    required this.publisher,
    required this.edition,
    required this.volume,
    required this.year,
    required this.resenha,
    required this.lendFlag,
    required this.condition,
    required this.position,
    required this.pageNumber,
    required this.rating,
    required this.language,
    required this.category,
  });

  toJson(){
    return {
      "title"           : title,
      "author"          : author, 
      "illustrator"     : illustrator, 
      "collection"      : collection, 
      "publisher"       : publisher, 
      "edition"         : edition, 
      "volume"          : volume, 
      "year"            : year, 
      "resenha"         : resenha,
      "lendFlag"        : lendFlag,
      "condition"       : condition,
      "position"        : position,
      "pageNumber"      : pageNumber,
      "rating"          : rating,
      "language"        : language,
      "category"        : category
    };
  }
  setLendFlag(String newlendFlag) {
    
    return {
      "title"         : title,
      "author"        : author, 
      "illustrator"   : illustrator, 
      "collection"    : collection, 
      "publisher"     : publisher, 
      "edition"       : edition, 
      "volume"        : volume, 
      "year"          : year, 
      "resenha"       : resenha,
      "lendFlag"      : newlendFlag,
      "condition"     : condition,
      "position"      : position,
      "pageNumber"    : pageNumber,
      "rating"        : rating,
      "language"      : language,
      "category"      : category
    };
  }
  factory BookModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return BookModel(id           : document.id,
                     title        : data["title"], 
                     author       : data["author"], 
                     illustrator  : data["illustrator"], 
                     collection   : data["collection"], 
                     publisher    : data["publisher"], 
                     edition      : data["edition"], 
                     volume       : data["volume"], 
                     year         : data["year"], 
                     resenha      : data["resenha"],
                     lendFlag     : data["lendFlag"],
                     condition    : data["condition"],
                     position     : data["position"],
                     pageNumber   : data["pageNumber"],
                     rating       : data["rating"],
                     language     : data["language"],
                     category     : data["category"] 
                     );
  }
}