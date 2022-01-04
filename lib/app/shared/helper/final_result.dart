abstract class FinalResult<T, E> {
  bool success;
  T? successResult;
  E? errorResult;
  FinalResult({this.success = false, this.successResult, this.errorResult});
}
