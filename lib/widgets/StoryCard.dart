import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final String label;
  final String imageUrl;        // ✅ Background image
  final String profileUrl;      // ✅ Profile picture
  final bool isCreateStory;

  const StoryCard({
    super.key,
    required this.label,
    required this.imageUrl,
    required this.profileUrl,
    this.isCreateStory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // ✅ Dark gradient at bottom for text readability
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 60,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          // ✅ Profile picture or Create Story button
          Positioned(
            top: 10,
            left: 10,
            child: isCreateStory
                ? Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(Icons.add, color: Colors.white, size: 21),
            )
                : CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(profileUrl),
            ),
          ),

          // ✅ Label text at bottom
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
