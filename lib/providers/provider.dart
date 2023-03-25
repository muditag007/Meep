import 'package:flutter/material.dart';
import 'package:meep/models/user.dart';

class Provider with ChangeNotifier {
  List<HomePage> users = [];

  void getInfo(HomePage user) {}

  void updateUser(HomePage user) {}

  void deleteUser(HomePage user) {}
}
