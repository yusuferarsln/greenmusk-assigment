import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_musk_assigment/core/models/inputchipmodel.dart';

class SkillController extends ChangeNotifier {
  final List<ChipModel> chipList = [];
  final List<ChipModel> languageChipList = [];
  String? title;

  void adTitle(String newTitle) {
    title = newTitle;
    notifyListeners();
  }

  void chipAdd(String id, String name, String title) {
    chipList.add(ChipModel(id: id, name: name, title: title));
    notifyListeners();
  }

  void deleteChips(String id) {
    chipList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void languageChipAdd(String id, String name, String title) {
    languageChipList.add(ChipModel(id: id, name: name, title: title));
    notifyListeners();
  }

  void languageDeleteChips(String id) {
    languageChipList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
