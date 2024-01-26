import 'dart:developer';

import 'package:flutter/material.dart';

class ToDoListItem extends StatelessWidget {
  final Map<String, dynamic> task;
  final String type;
  final Function onDelete;
  final Function onShift;

  ToDoListItem(
    this.task,
    this.type,
    this.onDelete,
    this.onShift,
  );

  @override
  Widget build(BuildContext context) {
    // if (categoryName == "school") {
    //   Colors.green;
    // } else if (categoryName == "market") {
    //   Colors.orange;
    // } else {
    //   Colors.purple;
    // }
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            360,
          ),
          color: task['category_name'] == "school"
              ? Colors.green.withOpacity(0.5)
              : Colors.orange.withOpacity(0.5),
          border: Border.all(
            color: task['category_name'] == "school"
                ? Colors.green
                : Colors.orange,
          ),
        ),
        child: task['category_name'] == "school"
            ? Icon(
                Icons.school,
                color: Colors.green,
              )
            : Icon(
                Icons.shopping_cart,
                color: Colors.orange,
              ),
      ),
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          // Handle menu item selection
          if (value == 'view') {
            log("Clicked on view");
          } else if (value == 'delete') {
            onDelete();
          } else if (value == 'mark_completed') {
            onShift();
            // Handle mark as completed action
          }
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem<String>(
            value: 'view',
            child: ListTile(
              leading: Icon(Icons.visibility),
              title: Text('View'),
            ),
          ),
          const PopupMenuItem<String>(
            value: 'delete',
            child: ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
            ),
          ),
          PopupMenuItem<String>(
            value: 'mark_completed',
            child: ListTile(
              leading: Icon(Icons.check),
              title: Text(type == "completed"
                  ? "Move to Uncompleted"
                  : 'Mark as Completed'),
            ),
          ),
        ],
      ),
      title: Text(task['title']),
      isThreeLine: true,
      subtitle: Text(
        task['description'],
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
