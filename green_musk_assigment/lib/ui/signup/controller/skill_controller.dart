import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkillController extends ChangeNotifier {
  List<String> skills = [];
  List<Widget> skillButtons = [];

  void addSkill(String skill) {
    skills.add(skill);
    notifyListeners();
  }

  void skillButtonWidget(
      double width, double height, String buttonText, String title) {
    skillButtons.add(skillButton(width, height, buttonText, title));
    notifyListeners();
  }

  OutlinedButton skillButton(
      double width, double height, String buttonText, String title) {
    return OutlinedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ))),
        onPressed: () {},
        child: SizedBox(
          width: width * (title.length / 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              buttonText + title,
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.highlight_remove_rounded,
              color: Colors.white,
            )
          ]),
        ));
  }
}
