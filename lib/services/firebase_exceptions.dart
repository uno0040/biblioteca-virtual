import 'package:firebase_auth/firebase_auth.dart';

// estados de possiveis exceções
enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
}

class AuthExceptionHandler {
  //metodo que vai reconhecer o tipo de exceção e retornar o tipo
  static handleAuthException(FirebaseAuthException e) {
    AuthStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthStatus.wrongPassword;
        break;
      case "weak-password":
        status = AuthStatus.weakPassword;
        break;
      case "email-already-in-use":
        status = AuthStatus.emailAlreadyExists;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }
//gera uma mensagem baseada na exceção ocorrida 
  static String generateErrorMessage(error) {
    String errorMessage;
    switch (error) {
      case AuthStatus.invalidEmail:
        errorMessage = "O seu email não está correto.";
        break;
      case AuthStatus.weakPassword:
        errorMessage = "Sua senha deveria ter pelo menos 6 caracteres.";
        break;
      case AuthStatus.wrongPassword:
        errorMessage = "Seu email ou sua senha estão incorretos.";
        break;
      case AuthStatus.emailAlreadyExists:
        errorMessage =
            "Este email ja esta sendo usado para uma outra conta.";
        break;
      default:
        errorMessage = "Um erro ocorreu. Tente novamente mais tarde";
    }
    return errorMessage;
  }
}