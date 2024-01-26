import 'package:demo/components/text_title.dart';
import 'package:demo/new_item.dart';
import 'package:flutter/material.dart';

import 'components/to_do_list_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> completedTask = [
    {
      "category_name": "school",
      "description": "This is the description of completed task",
      "title": "This is the title",
    },
    {
      "category_name": "market",
      "description": "This is the description of completed task",
      "title": "This is the title",
    },
  ];
  List<Map<String, dynamic>> uncompletedTasks = [
    {
      "category_name": "school",
      "description": "This is the description of uncompleted task",
      "title": "This is the title",
    },
    {
      "category_name": "market",
      "description": "This is the description of uncompleted task",
      "title": "This is the title",
    },
  ];

  @override
  Widget build(BuildContext context) {
    /*
    var object = [];
    abc = object;
    abc.remove();
    object.add();
    */
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextTitle("Uncompleted"),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0XFFe9defe),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < uncompletedTasks.length; i++)
                    Column(
                      children: [
                        ToDoListItem(uncompletedTasks[i], "uncompleted", () {
                          setState(() {
                            uncompletedTasks.removeAt(i);
                          });
                        }, () {
                          setState(() {
                            var temp = uncompletedTasks[i];
                            uncompletedTasks.removeAt(i);
                            completedTask.add(temp);
                          });
                        }),
                        Divider(),
                      ],
                    ),
                ],
              ),
            ),
            TextTitle("Completed"),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0XFFe9defe),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < completedTask.length; i++)
                    Column(
                      children: [
                        ToDoListItem(completedTask[i], "completed", () {
                          setState(() {
                            completedTask.removeAt(i);
                          });
                        }, () {
                          setState(() {
                            var temp = completedTask[i];
                            completedTask.removeAt(i);
                            uncompletedTasks.add(temp);
                          });
                        }),
                        Divider(),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => NewItem(),
              ));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
