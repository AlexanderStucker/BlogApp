import 'package:flutter/material.dart';

class NavListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const NavListTile({super.key, 
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
