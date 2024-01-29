import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_app/store/pomodoro_store.dart';
import 'package:pomodoro_app/widgets/pomodoro_entry.dart';
import 'package:pomodoro_app/widgets/pomodoro_timer.dart';
import 'package:provider/provider.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(child: PomodoroTimer()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Observer(
                builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PomodoroEntry(
                        increment: store.started && store.isWorking ? null : store.incrementWorkTime,
                        decrement: store.started && store.isWorking ? null : store.decrementWorkTime,
                        title: 'Work',
                        value: store.workTime,
                      ),
                      PomodoroEntry(
                        increment:  store.started && !store.isWorking ? null : store.incrementRestTime,
                        decrement:  store.started && !store.isWorking ? null : store.decrementRestTime,
                        title: 'Rest',
                        value: store.restTime,
                      ),
                    ],
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
