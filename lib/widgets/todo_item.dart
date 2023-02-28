// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onTodoChange;
  final onDeleteItem;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onTodoChange,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 15),
        child: ListTile(
          onTap: () {
            // print("click todo");
            onTodoChange(todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBlue,
            size: 30,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                decoration: todo.isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: tdRed, borderRadius: BorderRadius.circular(5)),
            child: IconButton(
              color: Colors.white,
              onPressed: () {
                onDeleteItem(todo.id);
              },
              icon: Icon(Icons.delete),
              iconSize: 18,
            ),
          ),
        ));
  }
}
