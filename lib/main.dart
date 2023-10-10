import 'package:flutter/material.dart';
import 'homepage/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}



// class InfiniteScrollPageView extends StatefulWidget {
//   @override
//   _InfiniteScrollPageViewState createState() => _InfiniteScrollPageViewState();
// }

// class _InfiniteScrollPageViewState extends State<InfiniteScrollPageView> {
//   final PageController _pageController = PageController();
//   final List<String> pages = List.generate(3, (index) => 'Page $index');

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: _pageController,
//       scrollDirection: Axis.vertical,
//       itemCount: pages.length,
//       itemBuilder: (context, index) {
//         if (index == pages.length - 1) {
//           // Wenn die letzte Seite erreicht wurde, lade eine neue Seite
//           // Hier könnten Sie Ihren Ladevorgang starten und `pages` aktualisieren
//           pages.add('Neue Seite ${pages.length}');
//         }
//         return Center(child: Text(pages[index]));
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
// }

// void main() {
//   runApp(MaterialApp(home: InfiniteScrollPageView()));
// }
