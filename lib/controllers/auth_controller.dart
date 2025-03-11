import '../services/auth_service.dart';

class AuthController {
  final AuthService _authService = AuthService();

  Future<void> signUp(String username, String email, String password) async {
    await _authService.signUp(username, email, password);
  }

  Future<void> login(String email, String password) async {
    await _authService.login(email, password);
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
