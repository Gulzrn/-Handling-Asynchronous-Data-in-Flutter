import 'package:flutter/material.dart';
import 'post_model.dart';
import 'post_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostModel? post;
  bool isLoading = false;
  String? error;

  Future<void> loadPost() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final fetchedPost = await PostRepo().fetchRandomPost();
      setState(() {
        post = fetchedPost;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Random Post Viewer")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              isLoading
                  ? const CircularProgressIndicator()
                  : error != null
                  ? Text(
                    "Error: $error",
                    style: const TextStyle(color: Colors.red),
                  )
                  : post == null
                  ? const Text("No post loaded.")
                  : Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            post!.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(post!.body),
                        ],
                      ),
                    ),
                  ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: loadPost,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
