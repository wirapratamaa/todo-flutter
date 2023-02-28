import 'dart:ffi';

class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: "1", todoText: "Check Phone", isDone: true),
      ToDo(
        id: "2",
        todoText: "Check Laptop",
      ),
      ToDo(
        id: "3",
        todoText: "Check Car",
      ),
      ToDo(
        id: "4",
        todoText: "Check Kitchen",
      )
    ];
  }
}
