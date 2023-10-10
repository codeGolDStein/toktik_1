import 'package:flutter/material.dart';
import 'package:toktik/homepage/Bloc/home_bloc.dart';


class HomePageless extends StatelessWidget {
  // final int currentPage;
  // final int? lastPage;
  final PageController pageController;
  final List<Widget> pages;
  final HomeBloc homeBloc;
  final bool loading;
  const HomePageless(
      {super.key,
      // required this.currentPage,
      // required this.lastPage,
      required this.pageController,
      required this.pages,
      required this.homeBloc,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          // User ist scrollt bei der letzten Page nach ganz unten
          if (loading == false &&
              notification is ScrollUpdateNotification &&
              // currentPage == lastPage &&
              notification.metrics.extentAfter == 0) {
            homeBloc.add(LastPageDownEvent());
          }
          return false;
        },
        child: PageView(
            scrollDirection: Axis.vertical,
            controller: pageController,
            children: pages),
      ),
    );
  }
}
