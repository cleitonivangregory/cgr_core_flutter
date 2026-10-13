import 'package:cgr_core_flutter/ui/core/view_models/view_model.dart';

abstract class CGRFormViewModel<T> extends CGRViewModel<T> {
  new({required super.repository});

  T prepareItem();

  Future<void> save() async {
    try {
      loading();
      final item = prepareItem();
      await repository.create(item: item);
      success();
    } catch (e) {
      error();
    }
  }
}
