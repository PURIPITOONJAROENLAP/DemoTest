part of 'home_bloc.dart';

@immutable
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

class plus extends CounterEvent {}