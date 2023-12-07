import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:toktik/API/prompt.dart';
import 'package:toktik/API/api_services.dart';
import 'package:toktik/infocard/infotext.dart';
import 'package:toktik/usefull%20/converter.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LastPageDownEvent>(lastpagedownevent);
  }

  FutureOr<void> lastpagedownevent(
    LastPageDownEvent event, Emitter<HomeState> emit) async {
      try {
        emit(HomeLoadingNewPageState());
        PromptGenerator promptGenerator = PromptGenerator();
        String infotext =  await ApiService.fetchFromGpt(promptGenerator.getFactText(75, "german")); 
        log(infotext.toString());
        emit(HomeSuccessNewPageState(infotext: InfoText(infotext)));
      } catch(e){
        log("Fehler bei lastpage down: $e");
      }
  }
}
