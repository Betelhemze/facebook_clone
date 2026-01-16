import 'package:facebook_clone/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/widgets/notifications_page.dart';
import 'package:facebook_clone/home.dart';
import 'package:facebook_clone/widgets/friends_page.dart';
import 'package:google_sign_in/google_sign_in.dart';


class TopNavBar extends StatelessWidget {
  final int activeIndex;
  const TopNavBar({super.key, this.activeIndex = -1});

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                      (route) => false,
                );
              }
            },
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavIcon(
              icon: Icons.home,
              isActive: activeIndex == 0,
              onPressed: (){
                if (activeIndex != 0) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const Home()),
                  );
                }
              }),
          _NavIcon(
              icon: Icons.ondemand_video,
              isActive: activeIndex == 1,
          ),
          _NavIcon(
              icon: Icons.group,
              notificationCount: 1,
              isActive: activeIndex == 2,
              onPressed: (){
                if (activeIndex != 2) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const FriendsPage()),
                  );
                }
          }),
          _NavIcon(
              icon: Icons.storefront,
              isActive: activeIndex == 3,
          ),
          _NavIcon(
              icon: Icons.notifications,
              notificationCount: 2,
              isActive: activeIndex == 4,
          onPressed: (){
                if (activeIndex != 4) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const NotificationsPage()),
                  );
                }
          }),
          _NavIcon(
            icon: Icons.menu,
            isActive: activeIndex == 5,
            onPressed: () => _handleLogout(context),
          ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final int notificationCount;
  final VoidCallback? onPressed;

  const _NavIcon({
    super.key,
    required this.icon,
    this.isActive = false,
    this.notificationCount = 0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(
            icon,
            size: 30,
            color: isActive ? Colors.blue : Colors.grey[700],
          ),

          // Notification badge
          if (notificationCount > 0)
            Positioned(
              right: -6,
              top: -4,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  notificationCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
