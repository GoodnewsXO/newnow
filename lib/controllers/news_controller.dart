import 'package:flutter/material.dart';
import 'package:newnow/models/news.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewsController {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<Map<String, String>> _fetchCategories() async {
    try {
      final response = await supabase.from('categories').select('id, name');

      Map<String, String> categories = {};
      for (var category in response) {
        categories[category['id'] as String] = category['name'] as String;
      }
      return categories;
    } catch (e) {
      print('Error fetching categories: $e');
      return {};
    }
  }

  Future<List<News>> fetchTrendingNews() async {
    try {
      final response = await supabase
          .from('news')
          .select(
              '*, categories(name)') // Include category name in the initial fetch
          .order('views', ascending: false)
          .order('likes', ascending: false)
          .order('comments', ascending: false)
          .order('created_at', ascending: false)
          .limit(5);

      // Directly map the response to News objects, including category name
      return response.map((json) => News.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching trending news: $e');
      // TODO: Handle the error appropriately (e.g., show a snackbar)
      return [];
    }
  }

  Future<List<News>> fetchRecommendedNews() async {
    try {
      final response =
          await supabase.from('news').select('*, categories(name)').limit(5);

      // Directly map the response to News objects, including category name
      return response.map((json) => News.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching trending news: $e');
      // TODO: Handle the error appropriately (e.g., show a snackbar)
      return [];
    }
  }
}
