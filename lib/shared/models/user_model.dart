import 'dart:convert';

class UserModel {
  final String name;
  final String photo;
  final int score;

  UserModel({required this.name, required this.photo, this.score = 0});

  Map<String,dynamic> toMap(){
    return{
      'name':name,
      'photo':photo,
      'score':score,
    };
  } // criando o json de um objeto

  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(name: map['name'],photo: map['photo'],score: map['score']);
  } //criando objeto a partir de um array

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
