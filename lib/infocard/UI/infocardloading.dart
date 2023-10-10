import 'package:flutter/material.dart';
import 'package:toktik/Data/example.dart';


class InfoCardLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      // Stretching the Container
      widthFactor: 0.95,
      heightFactor: 0.95,

      child: Container(
        padding: EdgeInsets.all(35.0),

        // The Background:
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.0),
            // gradient: const RadialGradient(
            //   colors: [Colors.orangeAccent, Colors.orange],
            //   radius: 0.85,
            // )
            color: Colors.white,
        ),

        // Column which contains all the Widgets:
        child: const Column(
          children: [
            SizedBox(height: 330),
            CircularProgressIndicator(color: Colors.black,),
            SizedBox(height: 45),
          ],
        ),
      ),
    );
  }
}
