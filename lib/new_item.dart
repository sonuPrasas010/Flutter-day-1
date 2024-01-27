import 'package:demo/components/text_title.dart';
import 'package:demo/home_screen.dart';
import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  final title = "aff";
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  late TextEditingController taskTitle;
  late TextEditingController date;
  late TextEditingController time;
  late TextEditingController note;

  @override
  void initState() {
    taskTitle = TextEditingController();
    date = TextEditingController();
    time = TextEditingController();
    note = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    taskTitle.dispose();
    date.dispose();
    time.dispose();
    note.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // object = null;
    // object.neb.data;
    return Scaffold(
      appBar: AppBar(
        title: Text("New List Iem"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextTitle("Task Title"),
                TextFormField(
                  controller: taskTitle,
                  validator: (value) {
                    if (value == null) return "Invalid value";
                    if (value.trim().isEmpty) return "Value cannot be empty";
                    null;
                  },
                  decoration: InputDecoration(
                    fillColor: Color(0XFFF5F2F9),
                    filled: true,
                    hintText: "Task Item",
                    focusedBorder: formBorder(true),
                    enabledBorder: formBorder(false),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextTitle("Category Name"),
                Row(
                  children: [
                    Chip(
                      label: Text(
                        "Education",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.purple,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Chip(label: Text("Shop")),
                  ],
                ),
                // infinite width + infinite width
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextTitle("Date"),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) - 12,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null) return "Invalid value";
                              if (value.trim().isEmpty)
                                return "Value cannot be empty";
                              return null;
                            },
                            controller: date,
                            decoration: InputDecoration(
                              fillColor: Color(0XFFF5F2F9),
                              filled: true,
                              hintText: "Date",
                              focusedBorder: formBorder(true),
                              enabledBorder: formBorder(false),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextTitle("Time"),
                        // 300 px width
                        // 150 for each
                        // 150+150 = 300
                        // 300 -8 -8 = 300-16
                        // 150 -8 foe each
                        // 300 - 16 -8
                        // 300 - 24
                        // 150-12

                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) - 12,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null) return "Invalid value";
                              if (value.trim().isEmpty)
                                return "Value cannot be empty";
                              return null;
                            },
                            controller: time,
                            decoration: InputDecoration(
                              fillColor: Color(0XFFF5F2F9),
                              filled: true,
                              hintText: "Time",
                              focusedBorder: formBorder(true),
                              enabledBorder: formBorder(false),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                TextTitle("Note"),
                TextFormField(
                  controller: note,
                  maxLines: 3,
                  decoration: InputDecoration(
                    fillColor: Color(0XFFF5F2F9),
                    filled: true,
                    hintText: "Note",
                    focusedBorder: formBorder(true),
                    enabledBorder: formBorder(false),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      formKey.currentState!.validate();
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      // foregroundColor: Colors.pinkAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder formBorder(bool isForFocus) {
    if (isForFocus) {
      return OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1,
        ),
      );
    }
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 0,
      ),
    );
  }
}
