import 'package:flutter/material.dart';

import '../Data/example.dart';
import '../infocard/UI/infocard.dart';

class MyPost2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: InfoCard(
        title: "Konvergenz",
        body: Example.drugsinBoxing,
      ),
    );
  }
}