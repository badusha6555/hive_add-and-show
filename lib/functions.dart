import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/model/model.dart';

ValueNotifier<List<ProfileModel>> modelNotifier = ValueNotifier([]);
Future<void> addProfile(ProfileModel profile) async {
  final box = Hive.box<ProfileModel>('profileBox');
  await box.put('profile', profile);
}
