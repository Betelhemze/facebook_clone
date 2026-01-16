import 'package:flutter/material.dart';
import 'package:facebook_clone/topNavBar.dart';
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const TopNavBar(activeIndex: 4),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: const [
                  _SectionHeader(title: 'New'),
                  _NotificationItem(
                    leading: _CircleIcon(
                      color: Color(0xFF1877F2),
                      child: Text(
                        'f',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    title: 'We noticed a new login from a device or location that you don\'t usually use. Please review.',
                    time: '13d',
                    hasMenu: true,
                  ),
                  _NotificationItem(
                    leading: _AvatarStack(),
                    title: 'You have new friend suggestions: Mulugeta Yikuno, Nuraden Sultane and Beza Tefera.',
                    time: '12d',
                    trailing: Icon(Icons.person_add_alt_1, color: Color(0xFF1877F2)),
                  ),
                  _NotificationItem(
                    leading: _ShieldIcon(),
                    title: 'Learn how Meta will use your info in new ways to personalise your experiences.',
                    time: '55d',
                    hasMenu: true,
                  ),
                  _NotificationItem(
                    leading: _CircleIcon(
                      color: Color(0xFFEDEFF2),
                      child: Icon(Icons.person, color: Colors.grey),
                    ),
                    title: 'Blast to the past with your post from March 2022.',
                    time: '12d',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final Widget leading;
  final String title;
  final String time;
  final bool hasMenu;
  final Widget? trailing;

  const _NotificationItem({
    required this.leading,
    required this.title,
    required this.time,
    this.hasMenu = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, // handle navigation/action
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leading,
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            if (trailing != null) trailing!,
            if (hasMenu)
              IconButton(
                icon: const Icon(Icons.more_horiz, color: Colors.grey),
                onPressed: () {},
                tooltip: 'More',
              ),
          ],
        ),
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  final Color color;
  final Widget child;

  const _CircleIcon({required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}

class _AvatarStack extends StatelessWidget {
  const _AvatarStack();

  @override
  Widget build(BuildContext context) {
    // Simulated stacked avatars for the friend suggestions card
    return SizedBox(
      width: 56,
      height: 44,
      child: Stack(
        clipBehavior: Clip.none,
        children: const [
          _SmallAvatar(offsetX: 0, color: Colors.blueGrey),
          _SmallAvatar(offsetX: 18, color: Colors.orange),
          _SmallAvatar(offsetX: 36, color: Colors.pink),
        ],
      ),
    );
  }
}

class _SmallAvatar extends StatelessWidget {
  final double offsetX;
  final Color color;
  const _SmallAvatar({required this.offsetX, required this.color});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offsetX,
      top: 4,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}

class _ShieldIcon extends StatelessWidget {
  const _ShieldIcon();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(44, 44),
      painter: _ShieldPainter(),
    );
  }
}

class _ShieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final r = RRect.fromRectAndRadius(rect, const Radius.circular(22));
    final paintLeft = Paint()..color = const Color(0xFF1877F2);
    final paintRight = Paint()..color = const Color(0xFF85B6FF);

    // Split circle background
    canvas.save();
    canvas.clipRRect(r);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width / 2, size.height), paintLeft);
    canvas.drawRect(Rect.fromLTWH(size.width / 2, 0, size.width / 2, size.height), paintRight);
    canvas.restore();

    // Bell in center
    final bellPaint = Paint()..color = Colors.white.withOpacity(0.9);
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 10, bellPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
