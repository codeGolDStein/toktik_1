import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:toktik/Data/example.dart';
import 'package:toktik/infocard/UI/infocard.dart';

class MyPost1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: InfoCard(
        title: "Sport",
        body: Example.drugsinBoxing,
      ),
    );
  }
}