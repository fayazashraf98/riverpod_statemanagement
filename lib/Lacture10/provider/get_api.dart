import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Lecture 10: FutureProvider for API calls with JSON parsing
// This provider demonstrates how to fetch data from an API endpoint and handle the response.
// It returns a List<Map<String, dynamic>> (raw JSON data without a model class).
final postProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  try {
    // Make an HTTP GET request to dummyjson.com API endpoint for posts.
    final response = await https.get(Uri.parse('https://dummyjson.com/posts'));

    // Check if the response status code is 200 (success).
    if (response.statusCode == 200) {
      // Decode the JSON response body into a Map<String, dynamic>.
      final Map<String, dynamic> decoded =
          jsonDecode(response.body) as Map<String, dynamic>;

      // Extract the 'posts' array from the JSON response.
      final List<dynamic> data = decoded['posts'] as List<dynamic>;

      // Convert the dynamic list to a list of Map<String, dynamic> objects.
      // This represents each post as a dictionary of key-value pairs.
      final List<Map<String, dynamic>> postList = data
          .map((e) => e as Map<String, dynamic>)
          .toList();

      // Return the list of posts.
      return postList;
    } else {
      // If the response status is not 200, throw an exception with the status code and reason.
      throw Exception(
        'Failed to load posts: ${response.statusCode} ${response.reasonPhrase}',
      );
    }
  } catch (e) {
    // Catch any error (network, parsing, etc.) and throw a formatted exception message.
    throw Exception('Lecture 10 API error: $e');
  }
});
