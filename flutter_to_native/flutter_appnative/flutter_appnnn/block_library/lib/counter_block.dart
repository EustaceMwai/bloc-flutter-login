import 'package:bloc/bloc.dart';
import 'package:block_library/counter_event.dart';
import 'package:block_library/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  @override
  // TODO: implement initialState
  CounterState get initialState => CounterState.initial();

  get currentState => mapEventToState(currentState);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async*{
    // TODO: implement mapEventToState
    if(event is IncrementEvent){
      yield currentState..counter +=1;
    }else if(event is DecrementEvent){
      yield currentState..counter -=1;
    }


  }

}