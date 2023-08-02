import 'package:flutter/material.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/widgets/list.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todo = TODOList.todoList();
  final _toDoController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // color: Color.fromRGBO(160, 216, 179, 1),
             child: ListView(
               children: [
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 30),
                   color: Colors.transparent,
                   width: double.infinity,
                   height: 50,
                   child: Text("TO DO's" , style: TextStyle(fontSize: 50 , fontWeight: FontWeight.w700 , color: Color.fromRGBO(25, 167, 206, 1)),),
                 ),
                 for(TODOList todo in todo)
                   ListItem(todo: todo,onToDoChanged: _handleToDoChange,onDeleteItem: _deleteToDoItem,),
               ],
             ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 10,
                    left: 30
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(25, 167, 206, 1),
                    boxShadow: const[BoxShadow(
                      color: Color.fromRGBO(25, 167, 206, .5),
                      offset: Offset(0.0,0.0),
                      blurRadius: 5,
                      spreadRadius: 1.0,
                    )],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 15),
                    child: TextField(
                      controller: _toDoController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "add",
                        hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  // height: 50,
                  child: ElevatedButton(
                    child: Text('+' , style: TextStyle(fontSize: 25),),
                    onPressed: (){_addToDo(_toDoController.text);},
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(25, 167, 206, 1),
                      minimumSize: Size.square(55),
                      elevation: 5,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(TODOList todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id){
    setState(() {
      todo.removeWhere((item)=> item.id == id);
    });
  }

  void _addToDo(String toDo){
    setState(() {
      todo.add(TODOList(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo));
    });
    _toDoController.clear();
  }
}