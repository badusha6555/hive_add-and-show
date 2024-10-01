import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/model/model.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileBox = Hive.box<ProfileModel>('profileBox');
    final profile = profileBox.getAt(0);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: profile != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Name: ${profile.name}'),
                  Text('Age: ${profile.age}'),
                  Text('Phone: ${profile.phone}'),
                  profile.imagePath.isNotEmpty
                      ? Image.file(File(profile.imagePath))
                      : const Text('No image selected'),
                ],
              ),
            )
          : const Center(child: Text('No profile data')),
    );
  }
}
