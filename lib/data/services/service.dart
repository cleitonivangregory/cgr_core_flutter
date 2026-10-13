abstract class CGRService<T> {
  Future<void> post({required T item});
  Future<List<T>> get();
  Future<void> put({required T item});
  Future<void> delete({required T item});
}
