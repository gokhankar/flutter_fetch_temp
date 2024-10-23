import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/controllers/open_controller.dart';
import 'package:new_app/controllers/todo_list_controller.dart';

class Home extends StatelessWidget {
  final String title;

  Home({super.key, required this.title});

  final todoListController = Get.put(TodoListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Obx(
        () => Center(
          child: todoListController.todoList.isEmpty
              ? Text("No todo found")
              :
              // AnimatedList(itemBuilder: (context, index, animation) {
              //     return SlideTransition(
              //       position: animation.drive(),
              //       child: ListTile(
              //         leading: Text(

              //             todoListController.todoList[index].id.toString()),
              //       ),
              //     );
              //   })

              ListView(
                  children: [
                    for (var todo in todoListController.todoList)
                      GestureDetector(
                        onTap: () {
                          showTodoInModal(todo);
                        },
                        child: ListTile(
                          leading: Text(
                            todo.id.toString(),
                          ),
                          title: Text(
                            todo.title ?? "Title",
                            maxLines: 1,
                          ),
                          trailing: Checkbox(
                              value: todo.completed,
                              onChanged: (value) {
                                print(value);
                              }),
                        ),
                      )
                  ],
                ),
        ),
      ),
    );
  }
}




// class DataFetchingScreen extends StatefulWidget {
//   @override
//   _DataFetchingScreenState createState() => _DataFetchingScreenState();
// }
// class _DataFetchingScreenState extends State<DataFetchingScreen> {
//   Future fetchData() async {
//     final response = await http.get(Uri.parse('https://api.example.com/data'));
//     if (response.statusCode == 200) {
//       // If the server returns a 200 OK response, parse the JSON
//       return json.decode(response.body);
//     } else {
//       // If the server did not return a 200 OK response, throw an exception.
//       throw Exception('Failed to load data');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data Fetching Example'),
//       ),
//       body: Center(
//         child: FutureBuilder(
//           future: fetchData(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator(); // Show a loading indicator while fetching data
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               // Display the fetched data
//               return Text('Fetched Data: ${snapshot.data}');
//             }
//           },
//         ),
//       ),
//     );
//   }
// }



// ListView.builder(
//   itemCount: snapshot.data.length,
//   itemBuilder: (context, index) {
//     // Build custom widgets based on fetched data
//     return ListTile(
//       title: Text(snapshot.data[index]['title']),
//       subtitle: Text(snapshot.data[index]['description']),
//       onTap: () {
//         // Handle item tap event
//       },
//     );
//   },
// )