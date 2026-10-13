import 'package:cgr_core_flutter/cgr_core_flutter.dart';
import 'package:cgr_core_flutter/ui/core/view_models/view_model.dart';

abstract class CGRFormViewModel<T> extends CGRViewModel<T> {
  new({required this.repository});

  final CGRRepository<T> repository;

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
