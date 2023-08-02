import 'package:flutter/material.dart';
import 'package:to_do_list/models/todo.dart';

class ListItem extends StatelessWidget {
  final TODOList todo;
  final onToDoChanged;
  final onDeleteItem;

  const ListItem({Key? key, required this.todo , required this.onToDoChanged , required this.onDeleteItem}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // color: Color.fromRGBO(160, 216, 179, 0.3),
        margin: EdgeInsets.only(bottom: 2),
        // height: 70,
        child: Center(
          child: ListTile(
            onTap: () {onToDoChanged(todo);},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            // tileColor: Color.fromRGBO(160, 216, 179, 1),
            tileColor: Color.fromRGBO(175, 211, 226, 1),
            textColor: Colors.black,
            splashColor: Color.fromRGBO(25, 167, 206, 1),
            leading: IconButton(icon:todo.isDone?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),color: Color.fromRGBO(20, 108, 148, 1), splashColor: Color.fromRGBO(25, 167, 206, 1),onPressed: (){},),
            title: Text(
              todo.todoText!,
              style:TextStyle(fontSize: 16, color: Color.fromRGBO(20, 108, 148, 1) , fontWeight: FontWeight.w500 ,decoration: todo.isDone? TextDecoration.lineThrough:null),
            ),
            trailing: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 70,
              // width: 35,
              // color: Colors.white,
              child: IconButton(
                color: Color.fromRGBO(20, 108, 148, 1),
                iconSize: 35,
                icon: Icon(Icons.delete),
                splashColor: Color.fromRGBO(25, 167, 206, 1),
                onPressed: (){onDeleteItem(todo.id);},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
