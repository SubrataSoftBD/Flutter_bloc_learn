
 class SwitchState {
  bool isSwitch;
  double sliderValue;
  SwitchState({this.isSwitch = false, this.sliderValue = 1.0});

  SwitchState copyWith({bool? isSwitch, double? sliderValue}){
    return SwitchState(
      isSwitch: isSwitch ?? this.isSwitch,
      sliderValue: sliderValue ?? this.sliderValue
    );
  }

  @override
  List<Object?> get props => [isSwitch, sliderValue];
}
