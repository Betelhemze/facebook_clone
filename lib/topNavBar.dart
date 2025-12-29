import 'package:flutter/material.dart';
import 'package:facebook_clone/widgets/Notificarionspage.dart';
import 'package:facebook_clone/home.dart';
import 'package:facebook_clone/widgets/friendspage.dart';


class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

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
              isActive: true,
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Home()),
                );
              }),
          const _NavIcon(icon: Icons.ondemand_video),
          _NavIcon(
              icon: Icons.group,
              notificationCount: 1,
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => FriendsPage()),
                );

          }),
          const _NavIcon(icon: Icons.storefront),
          _NavIcon(
              icon: Icons.notifications,
              notificationCount: 2,
          onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => NotificationsPage()),
                );
          }),
          const _NavIcon(icon: Icons.menu),
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
    return Stack(
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
    );
  }
}
