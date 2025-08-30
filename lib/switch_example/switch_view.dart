import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/switch_example/bloc/switch_bloc.dart';

import 'bloc/switch_event.dart';
import 'bloc/switch_state.dart';

class SwitchView extends StatelessWidget {
  const SwitchView({super.key});

  @override
  Widget build(BuildContext context) {
    print("Whole");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (prev, current) => prev.isSwitch != current.isSwitch,
              builder: (context, state) {
                print("One");
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Notification"),
                    Switch(value: state.isSwitch, onChanged: (value) {
                      context.read<SwitchBloc>().add(EnabledDisabledNotification());
                    }),
                  ],
                );
              },
            ),
            SizedBox(height: 50),
            BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (prev, current) => prev.sliderValue != current.sliderValue,
                builder: (context, state){
              print("Two");
              return Container(height: 200, color: Colors.red.withValues(alpha: state.sliderValue));
            }),
            SizedBox(height: 50),
          BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (prev, current) => prev.sliderValue != current.sliderValue,
              builder: (context, state){
            print("Three");
            return   Slider(value: state.sliderValue, onChanged: (value) {
              print(value);
              context.read<SwitchBloc>().add(SliderEvent(  slider: value));
            });
          })
          ],
        ),
      ),
    );
  }
}
