import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String birth;
  final String password;
  final String cep;
  final String street;
  final String neighborhood;
  final String city;
  final String number;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.birth,
    required this.password,
    required this.cep,
    required this.street,
    required this.neighborhood,
    required this.city,
    required this.number,
  });

  toJson(){
    return {
      "name"          : name,
      "email"         : email,
      "phone"         : phone,
      "birth"         : birth,
      "password"      : password,
      "cep"           : cep,
      "street"        : street,
      "neighborhood"  : neighborhood,
      "city"          : city,
      "number"        : number,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(id:            document.id, 
                     name:          data["name"], 
                     email:         data["email"], 
                     phone:         data["phone"], 
                     birth:         data["birth"], 
                     password:      data["password"], 
                     cep:           data["cep"], 
                     street:        data["street"], 
                     neighborhood:  data["neighborhood"], 
                     city:          data["city"], 
                     number:        data["number"],
                     );
  }
}