import 'package:cgr_core_flutter/cgr_core_flutter.dart';
import 'package:cgr_core_flutter/ui/core/view_models/view_model.dart';

abstract class CGRListViewModel<T> extends CGRViewModel<T> {
  new({required this.repository});

  final CGRRepository<T> repository;

  List<T> items = [];

  Future<void> load() async {
    try {
      loading();
      items = await repository.read();
      success();
    } catch (e) {
      error();
    }
  }

  Future<void> remove({required T item}) async {
    try {
      loading();
      await repository.delete(item: item);
      success();
    } catch (e) {
      error();
    }
  }
}
