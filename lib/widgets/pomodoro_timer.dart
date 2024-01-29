import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_app/store/pomodoro_store.dart';
import 'package:pomodoro_app/widgets/timer_button.dart';
import 'package:provider/provider.dart';

class PomodoroTimer extends StatelessWidget {
  const PomodoroTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (_) {
        return Container(
          color: store.isWorking ? Colors.red : Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                store.isWorking ? 'Work Time' : 'Rest Time',
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  fontSize: 100,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: store.started,
                    replacement: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TimerButton(
                        action: store.start,
                        text: 'Start',
                        icon: Icons.play_arrow,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TimerButton(
                        action: store.stop,
                        text: 'Stop',
                        icon: Icons.stop,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TimerButton(
                      action: store.restart,
                      text: 'Refresh',
                      icon: Icons.refresh,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
