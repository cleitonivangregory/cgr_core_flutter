import 'package:cgr_core_flutter/cgr_core_flutter.dart';

abstract class CGRRepository<T> {
  new({required this.service});

  final CGRService<T> service;

  Future<void> create({required T item}) async {
    await service.post(item: item);
  }

  Future<List<T>> read() async {
    return await service.get();
  }

  Future<void> update({required T item}) async {
    await service.put(item: item);
  }

  Future<void> delete({required T item}) async {
    await service.delete(item: item);
  }
}
