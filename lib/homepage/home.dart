import 'dart:collection';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toktik/homepage/UI/home_widget.dart';
import 'package:toktik/infocard/UI/infocard.dart';
import '../../Data/pagelist.dart';
import '../infocard/UI/infocardloading.dart';
import '../infocard/infotext.dart';
import 'Bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  // A dynamic list with all loading pages when a page is loading
  // this page will be added to "_loadingqueue"
  final Queue<int> _loadingqueue = Queue<int>();
  List<Widget> _pages = pages; // List musst be of Type Infotext
  List<InfoText> _textList = [];

  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void lastPageDown() {
    log("Bottom");
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        if (state is HomeSuccessNewPageState) {
          // pages wird hier aktualisert:
          setState(() {
            final successState = state as HomeSuccessNewPageState;
            // String newtext = successState.text;
            List<Widget> updatedPages = List.from(_pages);
            updatedPages[_loadingqueue.first] = InfoCard(
                title: successState.infotext.header,
                body: successState.infotext.text);
                // title: "title test",
                // body: "body test");
            _pages = updatedPages;
          });
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeInitial:
            return HomePageless(
              pageController: _pageController,
              pages: _pages,
              homeBloc: homeBloc,
              loading: false,
            );

          case HomeLoadingNewPageState:
            _pages.add(InfoCardLoading());
            _loadingqueue
                .add(_pages.length - 1); // adding page which is loading
            // log(_loadingqueue.first.toString());
            return HomePageless(
              pageController: _pageController,
              pages: _pages,
              homeBloc: homeBloc,
              loading: true,
            );

          case HomeSuccessNewPageState:
            
            final successState = state as HomeSuccessNewPageState;
            // String newtext = successState.text;
            List<Widget> updatedPages = List.from(_pages);
            log("Header: " + successState.infotext.header);
            log("Text: " + successState.infotext.text);
            updatedPages[_loadingqueue.first] = InfoCard(
                title: successState.infotext.header,
                body: successState.infotext.text);
                // title: "test",
                // body: "body test");
            _loadingqueue.removeFirst();
            _pages = updatedPages;
            return HomePageless(
              pageController: _pageController,
              pages: _pages,
              homeBloc: homeBloc,
              loading: false,
            );

          default:
            // Hier wird ein Fehler angezeigt, wenn ein unbekannter Zustand auftritt
            return Scaffold(
              body: Center(
                child: Text('Unbekannter Zustand: $state'),
              ),
            );
        }
      },
    );
  }
}
