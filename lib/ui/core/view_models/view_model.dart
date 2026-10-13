import 'package:cgr_core_flutter/cgr_core_flutter.dart';

abstract class CGRViewModel<T> extends ChangeNotifier {
  CGRState _state = CGRState.idle;

  bool get isIdle => _state == CGRState.idle;
  bool get isLoading => _state == CGRState.loading;
  bool get isSuccess => _state == CGRState.success;
  bool get isError => _state == CGRState.error;

  void idle() {
    _setState(state: CGRState.idle);
  }

  void loading() {
    _setState(state: CGRState.loading);
  }

  void success() {
    _setState(state: CGRState.success);
  }

  void error() {
    _setState(state: CGRState.error);
  }

  void _setState({required CGRState state}) {
    _state = state;
    notifyListeners();
  }
}
