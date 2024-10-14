import 'package:attendace_task_app/widgets/my_button.dart';
import 'package:attendace_task_app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _usernameController = TextEditingController();
  final _fullNameController = TextEditingController();

  String username = "testname";
  String profilePictureUrl =
      'https://via.placeholder.com/150'; // Placeholder URL

  @override
  void initState() {
    super.initState();
    _usernameController.text = username;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    setState(() {
      username = _usernameController.text;
    });
    // You can implement additional logic to save these changes to your backend or database.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile updated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PROFILE',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        elevation: 2.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.go('/home_user');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Profile Picture Section
            GestureDetector(
              onTap: () {
                // Implement the logic to change the profile picture
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    profilePictureUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Editable Username Field
            Text(
              'Username',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: _usernameController,
              hintText: 'Change your username',
              obscureText: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
              onFieldSubmitted: (_) {},
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),

            // Editable Full Name Field
            Text(
              'Full Name',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: _fullNameController,
              hintText: 'Change your full name',
              obscureText: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
              onFieldSubmitted: (_) {},
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),

            // Save Changes Button
            MyButton(
              onTap: _saveChanges,
              title: 'Save Changes',
            ),
          ],
        ),
      ),
    );
  }
}
