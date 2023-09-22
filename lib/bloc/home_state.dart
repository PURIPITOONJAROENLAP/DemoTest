part of 'home_bloc.dart';

@immutable
enum CounterStatus {
  initialized,
  loading
}
class CounterState {
  const CounterState._(
      {
        this.status,
      });
  const CounterState({
    this.status = CounterStatus.initialized,
  });
  const CounterState.initialized() : this._(status: CounterStatus.initialized);
  CounterState copyWith({
    CounterStatus? status,
  }) {
    return CounterState(
      status: status ?? this.status,
    );
  }
  final CounterStatus? status;
}

