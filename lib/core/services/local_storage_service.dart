import 'package:cgpa_app/core/model/result.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService{
late Box _resultBox;
late Box _usersBox;

Box get userBox => _usersBox;
Box get resultBox => _resultBox;

void initializeBox() async{
  _usersBox = await Hive.openBox('Users');
  _resultBox = await Hive.openBox('Results');
}

void saveUser(User user){
  _usersBox.put(user.username, user);
}

void deleteUser(User user){
  _usersBox.delete(user.username);
}

void saveResult(Result result){
  _resultBox.put(result.semester, result);
}

void getResult(String semester){
  _resultBox.get(semester);
}

void deleteResult(String semester){
  _resultBox.delete(semester);
}

void clear(){
  _resultBox.clear();
}

}

class User{
  int? id;
  String? username;
  String? fullName;
  User({this.username, this.fullName, this.id});
  factory User.fromJson(Map<String, dynamic> json)=> User(
    fullName: json['fullName'],
    username: json['username'],
    id: json['id']
  );

  Map<String, dynamic> toJson()=> {
    'fullName': fullName,
    'username': username,
    'id': id
  };
}