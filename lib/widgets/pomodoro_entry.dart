import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_app/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class PomodoroEntry extends StatelessWidget {
  final void Function()? increment;
  final void Function()? decrement;
  final String title;
  final int value;

  const PomodoroEntry({
    super.key,
    required this.increment,
    required this.decrement,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 10),
        Observer(
          builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Provider.of<PomodoroStore>(context).isWorking ? Colors.red : Colors.green, 
                  ),
                  onPressed: decrement,
                  child: const Icon(
                    Icons.arrow_downward,
                    color: Colors.white
                  ),
                ),
                Text(
                  '$value min',
                  style: const TextStyle(fontSize: 18),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Provider.of<PomodoroStore>(context).isWorking ? Colors.red : Colors.green, 
                  ),
                  onPressed: increment,
                  child: const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
