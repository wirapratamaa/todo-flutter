import 'package:flutter/material.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                // searchBox(),
                addTodoInput(),
                Expanded(
                  child: todosList.isNotEmpty
                      ? ListView(
                          children: [
                            titleTodo(),
                            for (ToDo todoo in todosList)
                              TodoItem(
                                todo: todoo,
                                onTodoChange: _handleTodoChange,
                                onDeleteItem: _handleDeleteItem,
                              ),
                          ],
                        )
                      : Container(
                          alignment: Alignment.center,
                          child: Text("Nothing Todo"),
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleTodoChange(ToDo toDo) {
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }

  void _handleDeleteItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addTodoItem(String toDo) {
    if (toDo.isNotEmpty) {
      setState(() {
        todosList.add(ToDo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            todoText: toDo));
      });
      _todoController.clear();
    }
  }

  Widget addTodoInput() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: _todoController,
              decoration: InputDecoration(
                  hintText: "Add todo Item", border: InputBorder.none),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20, right: 20, top: 20),
          child: ElevatedButton(
            onPressed: () {
              _addTodoItem(_todoController.text);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: tdBlue,
                minimumSize: Size(55, 55),
                elevation: 10),
            child: Text(
              "+",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget titleTodo() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 30),
      child: Text(
        "All Todos",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: "Search ToDo"),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: tdBgColor,
        elevation: 0,
        title: Row(
          children: [
            Icon(
              Icons.menu,
              color: tdBlack,
              size: 30,
            ),
            SizedBox(
              height: 40,
              width: 40,
            )
          ],
        ));
  }
}
