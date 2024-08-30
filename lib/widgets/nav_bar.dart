import 'package:blog_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'nav_bar_list_tile.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onNewBlogCreated;

  const NavBar({super.key, required this.onNewBlogCreated});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1432821596592-e2c18b78144f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.zero,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 45,
                    child: ClipOval(
                      child: Image.network(
                        "https://images.unsplash.com/photo-1545996124-0501ebae84d0?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "AccountName",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "AccountEmail",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          NavListTile(
            icon: Icons.home,
            title: "Home",
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context, '/' as Route<Object?>);
            },
          ),
          const Divider(),
          NavListTile(
            icon: Icons.add_box_outlined,
            title: "Write new Blog",
            onTap: () async {
              Navigator.pop(context);
              // Prüfen ob der User als Guest eingeloggt ist
              if (_isGuestUser()) {
                _showGuestAlert(context);
              } else {
                final result = await Navigator.pushNamed(context, '/create');
                if (result == true) {
                  onNewBlogCreated();
                }
              }
            },
          ),
          const Divider(),
          Expanded( 
            child: Container(),
          ),
          const Divider(),
          NavListTile(
            icon: Icons.logout,
            title: "Logout",
            onTap: () async{
              await AuthService().signOut();
              Navigator.of(context).pushNamedAndRemoveUntil('/', (route)=> false);
            },
          ),
        ],
      ),
    );
  }


//Guest Logic
  bool _isGuestUser() {
    final currentUser = AuthService().getCurrentUser();
    return currentUser != null && currentUser.isAnonymous;
  }

  void _showGuestAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Guest'),
          content: const Text('Guests can not create a Blog. Please create a account with your e-mail'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
