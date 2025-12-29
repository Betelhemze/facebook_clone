import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String timeAgo;
  final String caption;
  final String? postImage;

  const PostCard({
    super.key,
    required this.profileImage,
    required this.userName,
    required this.timeAgo,
    required this.caption,
    this.postImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Header (profile + name + time)
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(profileImage),
              radius: 22,
            ),
            title: Text(
              userName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(timeAgo),
            trailing: const Icon(Icons.more_horiz),
          ),

          // ✅ Caption text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              caption,
              style: const TextStyle(fontSize: 15),
            ),
          ),

          const SizedBox(height: 10),

          // ✅ Post image (optional)
          if (postImage != null)
            Image.asset(
              postImage!,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

          const SizedBox(height: 10),

          // ✅ Likes, comments, shares row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                // ✅ Like icon
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.thumb_up, color: Colors.white, size: 14),
                ),
                const SizedBox(width: 6),
                const Text("203K"),

                const Spacer(),
                const Text("1.9K comments"),
                const SizedBox(width: 10),
                const Text("796 shares"),
              ],
            ),
          ),

          const Divider(height: 20),

          // ✅ Buttons row (Like, Comment, Share)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _PostButton(icon: Icons.thumb_up_alt_outlined, label: "Like"),
              _PostButton(icon: Icons.mode_comment_outlined, label: "Comment"),
              _PostButton(icon: Icons.share_outlined, label: "Share"),
            ],
          ),
        ],
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PostButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[700]),
        const SizedBox(width: 6),
        Text(label, style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }
}
