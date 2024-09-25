import 'package:firebase_auth/firebase_auth.dart';
import 'package:application_muito_foda/services/firebase_exceptions.dart';

class AuthenticationService {
  final _auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;
  static late AuthStatus _status;
  var acs = ActionCodeSettings(
      url: '',
      handleCodeInApp: true,
      iOSBundleId: '',
      androidInstallApp: true,
      androidMinimumVersion: '10');

  // tratamento de exceção de cadastro do usúario
  Future<AuthStatus> createAccount({
    required String name,
    required String email, //vai ser autenticado
    required String password, //vai ser autenticado
  }) async {
    try {
      UserCredential newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _auth.currentUser!.updateDisplayName(name);
      _status = AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      //essas exceções são tratadas pelo metodo handlerAuthException da classe AuthExceptionHandler
      _status = AuthExceptionHandler.handleAuthException(
          e); //retorna o tipo de exceção caso tenha ocorrido
    }
    return _status;
  }

  Future<AuthStatus> changePassword(
      {required email, required password, required newPassword}) async {
    var cred = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newPassword);
      _status = AuthStatus.successful;
    }).catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));

    return _status;
  }

  // Tratamento de autenticação para o login do usuario
  Future<AuthStatus> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _status = AuthStatus
          .successful; //o login ocorreu sem problemas retorna o estado successful
    } on FirebaseAuthException catch (e) {
      _status = AuthExceptionHandler.handleAuthException(
          e); //retorna o tipo de exceção caso tenha ocorrido
    }
    return _status;
  }

  Future<AuthStatus> resetPassword({required String email}) async {
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => _status = AuthStatus.successful)
        .catchError(
            (e) => _status = AuthExceptionHandler.handleAuthException(e));
    return _status;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
