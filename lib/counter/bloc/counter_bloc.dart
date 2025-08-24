
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(): super(CounterState()){
    on<IncrementCounterEvent>(_increment);
    on<DecrementCounterEvent>(_decrement);
  }

  void _increment(IncrementCounterEvent event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter + 1));

  }
  void _decrement(DecrementCounterEvent event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter - 1));

  }
}
