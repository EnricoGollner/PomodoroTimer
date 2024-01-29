import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum IntervalType { working, rest }

abstract class _PomodoroStore with Store {
  @observable
  int minutes = 2;

  @observable
  int seconds = 0;

  @observable
  int workTime = 2;

  @observable
  int restTime = 1;

  @observable
  bool started = false;

  @observable
  IntervalType intervalType = IntervalType.rest;

  Timer? timer;

  @action
  void incrementWorkTime() {
    workTime++;
    if (isWorking) restart();
  }

  @action
  void decrementWorkTime() {
    if (workTime > 1) {
      workTime--;
      if (isWorking) restart();
    }
  }

  @action
  void incrementRestTime() {
    restTime++;
    if (!isWorking) restart();
  }

  @action
  void decrementRestTime() {
    if (restTime > 1) {
      restTime--;
      if (!isWorking) restart();
    }
  }

  @action
  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (minutes == 0 && seconds == 0) {
        _changeIntervalType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }

  @action
  void stop() {
    started = false;
    timer?.cancel();
  }

  @action
  void restart() {
    stop();
    minutes = isWorking ? workTime : restTime;
    seconds = 0;
  }

  bool get isWorking => intervalType == IntervalType.working;

  void _changeIntervalType() {
    if (isWorking) {
      intervalType = IntervalType.rest;
      minutes = restTime;
    } else {
      intervalType = IntervalType.working;
      minutes = workTime;
    }

    seconds = 0;
  }
}
