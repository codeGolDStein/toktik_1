import 'package:flutter/material.dart';
import 'package:toktik/Data/example.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String body;
  final Widget subIcon;

  const InfoCard(
      {required this.title,
      required this.body,
      // required this.onMoreTap,
      this.subIcon = const CircleAvatar(
        child: Icon(
          Icons.navigate_next_outlined,
          color: Colors.white,
          size: 37,
        ),
        backgroundColor: Colors.orange,
        radius: 25,
      ),
      // this.subInfoText = "545 miles",
      // this.subInfoTitle = "Directions",
      Key? key})
      : super(key: key);

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
            // )),
            color: Colors.white,
            // image: const DecorationImage(
            //   image: AssetImage("assets/background pics/white.jpeg"),
            //   fit: BoxFit.cover
            // ),
        ),

        // Column which contains all the Widgets:
        child: Column(
          children: [
            SizedBox(height: 15),

            // Title and "More" Button:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: "Cormorant_Garamond_bold",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            SizedBox(height: 25),

            // Info Text:
            Text(
              body,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "Cormorant_Garamond_text"),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
