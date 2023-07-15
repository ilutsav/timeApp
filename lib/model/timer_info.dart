import 'package:flutter/foundation.dart';

int _remainingTime = 60;

class TimerInfo extends ChangeNotifier {
  getRemainingTime() {
    return _remainingTime;
  }

  updateRemainingTime() {
    _remainingTime--;
    notifyListeners();
  }
}
