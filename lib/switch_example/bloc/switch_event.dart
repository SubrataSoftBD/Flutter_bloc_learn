import "package:equatable/equatable.dart";

// sealed class SwitchEvent {
abstract class SwitchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EnabledDisabledNotification extends SwitchEvent{
}
class SliderEvent extends SwitchEvent{
  double slider;

  SliderEvent({required this.slider});
  @override
  List<Object?> get props => [slider];

}
