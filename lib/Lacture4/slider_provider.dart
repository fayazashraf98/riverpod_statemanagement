import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// One provider holds the complete lecture 4 state object.
//
final SliderValue = StateProvider<AppState>((ref) {
  return AppState(slider: 0.5, showPassword: false);
});

// AppState groups the slider value and password visibility together.
class AppState {
  final double slider;
  final bool showPassword;

  AppState({required this.slider, required this.showPassword});

  // copyWith creates a new AppState while changing only selected fields.
  AppState copyWith({double? slider, bool? showPassword}) {
    return AppState(
      slider: slider ?? this.slider,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}

// This screen demonstrates reading and updating different fields from one state object.
class SliderProvider extends ConsumerWidget {
  const SliderProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This print helps show when the whole screen rebuilds.
    print("Slider value");
    return Scaffold(
      appBar: AppBar(title: const Text("Slider State Provider Mult:State")),
      body: Column(
        children: [
          const Text("Slider "),

          Consumer(
            builder: (context, ref, child) {
              // Read only the showPassword field so this section rebuilds by itself.
              final showPassword = ref.watch(
                SliderValue.select((state) => state.showPassword),
              );
              // This print shows rebuilds caused by showPassword changes.
              print("Show password changes");

              return InkWell(
                onTap: () {
                  // Read the notifier so we can update the current AppState.
                  final stateProvider = ref.read(SliderValue.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    showPassword: !showPassword,
                  );
                },
                child: showPassword
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              );
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              // Read only the slider field so the color box and slider rebuild independently.
              final sliderChange = ref.watch(
                SliderValue.select((state) => state.slider),
              );
              // This print shows rebuilds caused by slider changes.
              print('Slider');
              return Center(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: sliderChange),
                      ),
                    ),
                    Slider(
                      value: sliderChange,
                      onChanged: (value) {
                        // Update only the slider field and keep the rest of AppState unchanged.
                        final stateProvider = ref.read(SliderValue.notifier);
                        stateProvider.state = stateProvider.state.copyWith(
                          slider: value,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
