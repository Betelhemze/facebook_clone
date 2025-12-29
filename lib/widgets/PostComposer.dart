import 'package:flutter/material.dart';

class PostComposer extends StatelessWidget {
  const PostComposer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          // ✅ Profile picture
          const CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),

          const SizedBox(width: 10),

          // ✅ "What's on your mind?" input area
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                "What's on your mind?",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // ✅ Green image insert icon
          IconButton(
            onPressed: () {
              print("Insert image tapped");
            },
            icon: const Icon(
              Icons.image,
              color: Colors.green,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
