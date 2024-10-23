import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/models/todo_model.dart';

void showTodoInModal(Todo todo) {
  Get.defaultDialog(
    title: "Edit Todo ${todo.id}",
    content: Column(
      children: [Text(todo.title.toString())],
    ),
    confirm: ElevatedButton(onPressed: () {}, child: Text("Ok")),
  );
}
