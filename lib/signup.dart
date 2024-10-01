import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/model/model.dart';
import 'package:my_app/profile.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();
  File? _imageFile;

  void _selectImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _imageFile = File(image.path);
      } else {
        _imageFile = null;
      }
    });
  }

  void _submitForm() {
    final name = _nameController.text;
    final age = _ageController.text;
    final phone = _phoneController.text;
    final imagePath = _imageFile?.path ?? '';

    if (name.isNotEmpty &&
        age.isNotEmpty &&
        phone.isNotEmpty &&
        imagePath.isNotEmpty) {
      final profile = ProfileModel(
        name: name,
        age: age,
        phone: phone,
        imagePath: imagePath,
      );
      _saveProfile(profile);
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfilePage()));
  }

  void _saveProfile(ProfileModel profile) async {
    final box = Hive.box<ProfileModel>('profileBox');
    await box.put('profile', profile); // Store the profile as key-value pair
    print('Profile saved!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            const SizedBox(height: 10),
            _imageFile != null
                ? Image.file(_imageFile!, width: 100, height: 100)
                : const Placeholder(fallbackHeight: 100, fallbackWidth: 100),
            ElevatedButton(
              onPressed: _selectImage,
              child: const Text('Select Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
