import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: Text("New Screen"),
      ),
      body: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("hdgfhadfg"),
            ),
            Text("He"),
          ],
        ),
      ),
    );
  }
}
