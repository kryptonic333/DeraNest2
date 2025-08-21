

import 'package:flutter/material.dart';

class PostIconButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  const PostIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: color, size: 28),
    );
  }
}
