import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class ProfileModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String age;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String imagePath;

  ProfileModel({
    required this.name,
    required this.age,
    required this.phone,
    required this.imagePath,
  });
}
