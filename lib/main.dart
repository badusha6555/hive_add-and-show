import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/model/model.dart';
import 'package:my_app/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive
      .initFlutter(); // Without path_provider, Flutter uses a default directory

  // Register the ProfileModel adapter
  Hive.registerAdapter(ProfileModelAdapter());

  // Open a box to store profile data
  await Hive.openBox<ProfileModel>('profileBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupPage(),
    );
  }
}
