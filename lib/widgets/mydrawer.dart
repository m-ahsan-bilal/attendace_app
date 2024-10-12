import 'package:attendace_task_app/widgets/Mydrawertile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          MyDrawerTile(
              text: "S E T T I N G S",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                context.go('/settings');
                // MaterialPageRoute(builder: )
              }),
          const Spacer(),
          MyDrawerTile(
            text: "L O G  O U T",
            icon: Icons.logout_outlined,
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              context.go('/login');
            },
          ),
          const SizedBox(
            height: 25,
          ),

          // home list tile

          // settings list tile

          // log ou list tile
        ],
      ),
    );
  }
}
