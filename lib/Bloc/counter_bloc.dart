
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter101/Model/user/user_model.dart';
import 'package:flutter101/Service/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState.init()) {
    on<FetchDataEvent>(mapDataToState);
    on<IncrementEvent>(mapIncrementToState);
  }

  Future<void> mapDataToState(FetchDataEvent event, Emitter<CounterState> emit) async {
    try {
      final response = await DioService.getData();
      final data = response.data as List;
      final List<UserModel> users = List.from(data.map((e) => UserModel.fromJson(e)));

      if (users.isNotEmpty) {
        emit(state.copyWith(userModel: users, status: CounterStatus.done));
      }
    } catch (_) {
      throw _.toString();
    }
  }

  Future<void> mapIncrementToState(IncrementEvent event, Emitter<CounterState> emit) async {
    final users = state.userModel;
    int total = state.total;
    emit(state.copyWith(status: CounterStatus.add));
    try {
      for (var i = 0; i < users.length; i++) {
        if (users[i].id == event.id) {
          final counter = event.counter + 1;
          users[i] = users[i].copyWith(counter: counter);
          total = total + event.price;
        }
      }
      emit(state.copyWith(userModel: users, total: total, status: CounterStatus.done));
    } catch (_) {
      throw _.toString();
    }
  }
}
