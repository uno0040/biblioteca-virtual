import 'package:cloud_firestore/cloud_firestore.dart';

class LendModel {
  final String? id;
  final String  bookName;
  final String  startDate;
  final String  endDate;
  final String  status;
  final String  admConf;

  const LendModel ({
    this.id,
    required this.bookName,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.admConf
  });
  toJson(){ 
    return {
      "bookName"  : bookName,
      "startDate" : startDate,
      "endDate"   : endDate,
      "status"    : status, // ativo ou inativo
      "admConf"   : admConf
    };
  }
  factory LendModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return LendModel(id        : document.id,
                     bookName  : data["bookName"], 
                     startDate : data["startDate"], 
                     endDate   : data["endDate"],
                     status    : data["status"],
                     admConf   : data["admConf"] 
                     );
  }
}