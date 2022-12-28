part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

class FetchDataEvent extends CounterEvent {
  const FetchDataEvent();

  @override
  List<Object?> get props => [];
}

class IncrementEvent extends CounterEvent {
  const IncrementEvent({
    required this.id,
    required this.price,
    required this.counter,
  });

  final int id;
  final int price;
  final int counter;

  @override
  List<Object?> get props => [];
}
