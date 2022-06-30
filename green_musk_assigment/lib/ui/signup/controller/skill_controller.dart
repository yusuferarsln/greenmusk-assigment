import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkillController extends ChangeNotifier {
  List<String> skills = [];
  List<Widget> skillButtons = [];

  void addSkill(String skill) {
    skills.add(skill);
    notifyListeners();
  }

  void skillButtonWidget(double width, double height, String buttonText) {
    skillButtons.add(skillButton(width, height, buttonText));
    notifyListeners();
  }

  OutlinedButton skillButton(double width, double height, String buttonText) {
    return OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ))),
        onPressed: () {},
        child: Container(
          width: width * 0.2,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.add_circle_rounded), Text(buttonText)]),
        ));
  }
}
