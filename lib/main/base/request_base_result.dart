class BaseResult<T> {
  int? resultCode;
  late BaseStatus state;
  T? data;
  String? errorMessage;
  bool get success {
    return state == BaseStatus.success;
  }
}

enum BaseStatus { success, failure, networkFailure, unauthorized }
