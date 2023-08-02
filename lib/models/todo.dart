import 'package:flutter/cupertino.dart';

class TODOList {
  String? id;
  String? todoText;
  bool isDone;

  TODOList({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });
  static List<TODOList> todoList(){
    return [TODOList(id: "01", todoText: "hi namaihv" , isDone: true),
      TODOList(id: "02", todoText: "hi namaihv"),
      TODOList(id: "03", todoText: "hi namaihv"),
      TODOList(id: "04", todoText: "hi namaihv"),
      TODOList(id: "05", todoText: "hi namaihv"),];
  }
}