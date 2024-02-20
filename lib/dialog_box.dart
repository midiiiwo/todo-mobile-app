import 'package:flutter/material.dart';
import 'package:simple_todo_app/my_button.dart';

class DialogBox extends StatelessWidget {
   DialogBox({super.key, required this.controller, required this.onCancel , required this.onSave,});
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //to get user input
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "click to add task "),
              ),
              // buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  //save button
                    MyButton(text: "save", onPressed: onSave),
                  const SizedBox(width: 4,),
                  //cancel button
                  MyButton(text: "cancel", onPressed: onCancel),
                ],
              )
            ],
          )),
      backgroundColor: Colors.yellow,
    );
  }
}
