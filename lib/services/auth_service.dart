import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:newnow/models/user.dart';

class AuthService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> signUp(String username, String email, String password) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw Exception("User sign-up failed");
      }

      // Insert additional user details into 'users' table
      await supabase.from('users').insert({
        'id': response.user!.id,
        'username': username,
        'email': email,
        'profile_image': '',
      });
    } catch (e) {
      throw Exception("Error signing up: ${e.toString()}");
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
    } catch (e) {
      throw Exception("Error logging in: ${e.toString()}");
    }
  }

  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      throw Exception("Error signing out: ${e.toString()}");
    }
  }

  Future<Users?> getCurrentUser() async {
    final user = supabase.auth.currentUser;
    if (user == null) return null;

    // Fetch user details from the 'users' table
    final response =
        await supabase.from('users').select().eq('id', user.id).single();

    return Users.fromMap(response);
  }
}
