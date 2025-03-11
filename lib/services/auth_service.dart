import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:newnow/models/user.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<void> signUp(String username, String email, String password) async {
    try {
      await supabase.auth.signUp(email: email, password: password);
    } catch (e) {
      throw e.toString();
    }
    /*final response =
        await supabase.auth.signUp(email: email, password: password);
    if (response.error != null) {
      throw Exception(response.error!.message);
    }*/
  }

  Future<void> LogIn(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
    } catch (e) {
      throw e.toString();
    }
  }

  Users? getCurrentUser() {
    final user = supabase.auth.currentUser;
    if (user == null) return null;
    return Users(
        id: user.id, email: user.email!, username: '', profile_image: '');
  }
}
