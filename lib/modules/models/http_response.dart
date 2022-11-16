class HttpResponse<T> {
  final int status;
  final T? data;
  final bool success;
  final String? errorMessage;

  HttpResponse({
    required this.status, 
    this.data, 
    this.success = false, 
    this.errorMessage,
  });

  factory HttpResponse.success(int status, T data) {
    return HttpResponse<T>(
      status: status,
      success: true,
      data: data,
    );
  }

  factory HttpResponse.error(int status, String message) {
    return HttpResponse<T>(
      status: status,
      success: false,
      errorMessage: message,
    );
  }
}