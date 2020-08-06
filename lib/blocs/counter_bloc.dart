import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc_app/events/counter_event.dart';
import 'package:flutter_counter_bloc_app/states/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc():super(CounterStateInitial());
  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    // TODO: implement mapEventToState
    if(event is IncrementEvent){
        int currentValue = 0;
        if(state is CounterStateSuccess){
          currentValue = (state as CounterStateSuccess).number;
        }
        yield CounterStateLoading();
        //Call Api
        await Future.delayed(Duration(seconds: 1));
        final newNumber = currentValue + event.number;//(state as CounterStateSuccess).number + event.number;
        yield CounterStateSuccess(number: newNumber);
    }
    else if(event is DecrementEvent){
      int currentValue = 0;
      if(state is CounterStateSuccess){
        currentValue = (state as CounterStateSuccess).number;
      }
      yield CounterStateLoading();
      //Call Api
      await Future.delayed(Duration(seconds: 1));
      final newNumber = currentValue - event.number;//(state as CounterStateSuccess).number + event.number;
      yield CounterStateSuccess(number: newNumber);
    }
  }
}