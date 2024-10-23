import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_app/data/constant.dart';
import 'package:new_app/models/todo_list_model.dart';
import 'package:new_app/models/todo_model.dart';
import 'package:new_app/network/network_helper.dart';

class TodoListController extends GetxController {
  // var todoModel = Todo();
  var todoList = <Todo>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    getTodoList();
    super.onInit();
  }

  Future getTodoList() async {
    if (kDebugMode) {
      print('getTodoList() CALLED');
    }

    try {
      var response = await NetworkHelper.fetchData(listEndpoint);
      if (response != null) {
        todoList.value = todoListModelFromJson(response);
        print(todoList[0].id.toString());
      }
      return todoList;
    } catch (e) {
      return e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
