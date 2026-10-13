import 'package:cgr_core_flutter/cgr_core_flutter.dart';

abstract class CGRViewModel<T> extends ChangeNotifier {
  new({required this.repository});

  final CGRRepository<T> repository;

  CGRState state = CGRState.idle;

  void idle() {
    _setState(CGRState.idle);
  }

  void loading() {
    _setState(CGRState.loading);
  }

  void success() {
    _setState(CGRState.success);
  }

  void error() {
    _setState(CGRState.error);
  }

  void _setState(CGRState value) {
    state = value;
    notifyListeners();
  }
}
