import 'package:firebase_auth/firebase_auth.dart';

class Autenticacao {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> cadastrarUsuario({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String confirmPassword,
    required String area,
  }) async {
    try {
      // Verifica se as senhas são iguais
      if (password != confirmPassword) {
        throw FirebaseAuthException(
          code: 'password-mismatch',
          message: 'As senhas não coincidem.',
        );
      }

      // Cadastre o usuário com Firebase Auth
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Cadastro bem-sucedido
      return true;
    } catch (e) {
      // Se houver algum erro, retorne false
      print('Erro ao cadastrar usuário: $e');
      return false;
    }
  }
}
