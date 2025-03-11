import 'dart:math';
import 'package:newnow/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChannelController {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<Users>> fetchChannel() async {
    try {
      final List<dynamic> response = await supabase
          .from('users')
          .select('id, username, profile_image')
          .limit(8);

      List<Users> users = response
          .map((json) => Users.fromMap(json as Map<String, dynamic>))
          .toList();

      // Randomize the list
      users.shuffle(Random());

      return users;
    } catch (e) {
      print('Error fetching channel: $e');
      return [];
    }
  }
}
