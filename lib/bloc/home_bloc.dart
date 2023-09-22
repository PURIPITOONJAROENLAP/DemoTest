import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState.initialized());

  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is plus) {
      yield state.copyWith(status: CounterStatus.loading);
    }
  }
}
