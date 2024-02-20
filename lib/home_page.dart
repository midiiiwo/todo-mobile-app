import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_todo_app/dialog_box.dart';
import 'package:simple_todo_app/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.openBox('mybox');

  // List of todo tasks
  List<List<dynamic>> todoList = [

  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }
  //text controller
  final _controller = TextEditingController();
  //saveTask
  void saveNewTask(){
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }
//create a new task
  void createNewTask(){
     showDialog(context: context, builder: (context){
       return DialogBox(
         controller: _controller,
         onSave: saveNewTask,
         onCancel: ()=> Navigator.of(context).pop(),
       );
     });
  }
  //to delete task
  void deleteTask(int index){
      setState(() {
        todoList.removeAt(index);
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('TO DO'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
