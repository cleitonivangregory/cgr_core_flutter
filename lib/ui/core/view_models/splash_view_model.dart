import 'package:cgr_core_flutter/ui/core/view_models/view_model.dart';

class CGRSplashViewModel extends CGRViewModel {
  double progress = 0;

  Future<void> load() async {
    loading();

    const steps = 60;

    for (int i = 1; i <= steps; i++) {
      await Future.delayed(Duration(milliseconds: 50));
      progress = i / steps;
      notifyListeners();
    }

    success();
  }
}
