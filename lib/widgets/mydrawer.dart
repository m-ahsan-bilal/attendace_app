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
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: MyDrawerTile(
                text: "P R O F I L E",
                icon: Icons.person_2_outlined,
                onTap: () {
                  Navigator.pop(context);
                  context.go('/user_profile');
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home_outlined,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          MyDrawerTile(
              text: "S E T T I N G S",
              icon: Icons.settings_outlined,
              onTap: () {
                Navigator.pop(context);
                context.go('/settings_page');
                // MaterialPageRoute(builder: )
              }),
          // const Spacer(),
          MyDrawerTile(
            text: "L O G  O U T",
            icon: Icons.logout_outlined,
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              context.go('/login_user');
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
