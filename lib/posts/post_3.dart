import 'package:flutter/material.dart';

import '../Data/example.dart';
import '../infocard/UI/infocard.dart';

class MyPost3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: InfoCard(
        title: "Omar Hejab",
        body: Example.drugsinBoxing,
      ),
    );
  }
}