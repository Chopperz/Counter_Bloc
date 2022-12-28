part of 'counter_bloc.dart';

enum CounterStatus {initial, add, remove, done}

extension CounterStatusX on CounterStatus {
  bool get isInitial => this == CounterStatus.initial;
  bool get isAdd => this == CounterStatus.add;
  bool get isRemove => this == CounterStatus.remove;
  bool get isDone => this == CounterStatus.done;
}

class CounterState extends Equatable {
  const CounterState({
    this.status = CounterStatus.initial,
    this.userModel = const [],
    this.total = 0,
  });

  final CounterStatus status;
  final List<UserModel> userModel;
  final int total;

  const CounterState.init({
    this.status = CounterStatus.initial,
    this.userModel = const [],
    this.total = 0,
  });

  CounterState copyWith({CounterStatus? status, List<UserModel>? userModel, int? total}) {
    return CounterState(
      status: status ?? this.status,
      userModel: userModel ?? this.userModel,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [status, userModel, total];
}
