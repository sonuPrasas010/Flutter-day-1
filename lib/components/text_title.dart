

import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String title;

  TextTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Text(title),
    );
  }
}
