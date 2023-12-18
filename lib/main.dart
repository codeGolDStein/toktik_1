import 'package:flutter/material.dart';
import 'homepage/home.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

@immutable
class WidgetsFlutterBinding {
  // Correct constructor for an immutable class
  const WidgetsFlutterBinding();
}

class MyApp extends StatelessWidget {

  // WidgetsFlutterBinding widgetsFlutterBinding = const WidgetsFlutterBinding();

  // widgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
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
