import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/Lacture10/provider/get_api.dart';

// Lecture 10: UI for displaying API data with FutureProvider
// This widget shows how to consume a FutureProvider and display the data in a beautiful card-based UI.
// It handles loading, error, and data states cleanly using AsyncValue.when().
class GetApi extends ConsumerWidget {
  const GetApi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the postProvider FutureProvider to get the AsyncValue<List<Map<String, dynamic>>>.
    // The AsyncValue holds the state: loading, error, or data.
    final provider = ref.watch(postProvider);
    return Scaffold(
      // AppBar with a custom styled title.
      appBar: AppBar(
        title: const Text(
          "Posts",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      // Use AsyncValue.when() to handle all three states: loading, error, and data.
      body: provider.when(
        // Loading state: Show a spinner and loading message while fetching data.
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text("Loading posts..."),
            ],
          ),
        ),
        // Error state: Display an error icon and error message.
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Error: $error',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        // Data state: Display the list of posts in a ListView with beautiful cards.
        data: (value) => ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: value.length,
          itemBuilder: (context, index) {
            // Get the current post from the list. Each post is a Map<String, dynamic>.
            final post = value[index];
            // Build a card for each post with a modern design.
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                // Gradient background for visual appeal.
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white, Colors.grey.shade50],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row containing the post number badge and title.
                      Row(
                        children: [
                          // Number badge showing the post index (1-based).
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Post title with ellipsis if it's too long.
                          Expanded(
                            child: Text(
                              // Access the 'title' field from the JSON map.
                              post['title'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Post body text with line height for better readability.
                      Text(
                        // Access the 'body' field from the JSON map.
                        post['body'] as String,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          height: 1.5,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      // Row containing metadata badges (ID and User ID).
                      Row(
                        children: [
                          // ID badge displaying the post ID.
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              // Access the 'id' field from the JSON map.
                              'ID: ${post['id']}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // User ID badge displaying which user posted this.
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              // Access the 'userId' field from the JSON map.
                              'User: ${post['userId']}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.amber.shade900,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
