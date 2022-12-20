import 'package:firebase_core/firebase_core.dart';

class AppException implements Exception {
  final String? message;

  AppException([this.message]);

  @override
  String toString() {
    if(message != null) {
      return message!;
    }

    return "Ocorreu um erro ao processar seu pedido.";
  }
}

class IncorrectPassword extends AppException {
  final String? message;

  IncorrectPassword([this.message]);

  @override
  String toString() {
    if(message != null) {
      return message!;
    }

    return "Senha incorreta.";
  }
}

class UserNotFound extends AppException {
  final String? message;

  UserNotFound([this.message]);

  @override
  String toString() {
    if(message != null) {
      return message!;
    }

    return "Usuário não existe";
  }
}

class NoDataException extends AppException {
  final String? message;

  NoDataException([this.message]);

  @override
  String toString() {
    if(message != null) {
      return message!;
    }

    return "Não há informações no momento.";
  }
}

Exception decodeException(Exception error) {
  if(error is FirebaseException) {
    return _decodeFirebaseException(error);
  }

  return AppException();
}

Exception _decodeFirebaseException(FirebaseException error) {
  switch (error.code) {
    case "user-not-found":
      return UserNotFound();
    case "wrong-password":
      return IncorrectPassword();
    default:
      return AppException();
  }
}
