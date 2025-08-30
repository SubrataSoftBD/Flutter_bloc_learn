
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/switch_example/bloc/switch_event.dart';
import 'package:flutter_bloc_tutorial/switch_example/bloc/switch_state.dart';


class SwitchBloc extends Bloc<SwitchEvent, SwitchState>{
  SwitchBloc():super(SwitchState()){
    on<EnabledDisabledNotification>(_enableDisable);
    on<SliderEvent>(_sliderFunction);
  }


  void _enableDisable(EnabledDisabledNotification events, Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));

  }

  void _sliderFunction(SliderEvent events, Emitter<SwitchState> emit){
    emit(state.copyWith(sliderValue: events.slider));

  }

}