class AppException implements Exception {
  final String? message;

  const AppException([this.message]);

  @override
  String toString() {
    if(message != null) {
      return message!;
    }

    return "Error on App";
  }
}