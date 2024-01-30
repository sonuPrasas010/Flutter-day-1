import 'dart:io';

import 'package:demo/components/text_title.dart';
import 'package:demo/new_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/to_do_list_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> completedTask = [];
  List<Map<String, dynamic>> uncompletedTasks = [];
  bool isLoading = true;

  @override
  void initState() {
    // calls itself before ui is rendered on screen
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    // calls itself after ui is removed on screen

    super.dispose();
  }

  void loadData() async {
    //
    // post
    await Future.delayed(
      Duration(seconds: 3),
      () {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

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
        child: isLoading
            ? CircularProgressIndicator()
            : ListView(
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
                              ToDoListItem(uncompletedTasks[i], "uncompleted",
                                  () {
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
                    child: completedTask.isEmpty
                        ? Center(
                            child: Text("Empty text"),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var i = 0; i < completedTask.length; i++)
                                Column(
                                  children: [
                                    ToDoListItem(completedTask[i], "completed",
                                        () {
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
        onPressed: () async {
          // ahdfhasdfhjsdf
          var returnedValud = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => NewItem(),
              ));
          setState(() {
            this.uncompletedTasks.insert(0, returnedValud);
          });
          // log("page push balla balla vayo");
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  Future someFunction() async {
    return "null";
  }
}
