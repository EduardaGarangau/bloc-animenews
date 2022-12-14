class DatasourceException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  DatasourceException(this.message, [this.stackTrace]);

  @override
  String toString() {
    return 'DatasourceException: $message $stackTrace';
  }
}
