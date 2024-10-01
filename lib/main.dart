import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/model/model.dart';
import 'package:my_app/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive
      .initFlutter(); 

  Hive.registerAdapter(ProfileModelAdapter());


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
