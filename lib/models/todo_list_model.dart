// To parse this JSON data, do
//
//     final todoListModel = todoListModelFromJson(jsonString);

import 'dart:convert';

import 'package:new_app/models/todo_model.dart';

List<Todo> todoListModelFromJson(String str) =>
    List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoListModelToJson(List<Todo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
