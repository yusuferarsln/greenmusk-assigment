import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_musk_assigment/ui/signup/controller/skill_controller.dart';

class BuildProfilePage extends ConsumerStatefulWidget {
  const BuildProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BuildProfilePageState();
}

final contoller = ChangeNotifierProvider((ref) => SkillController());

class _BuildProfilePageState extends ConsumerState<BuildProfilePage> {
  TextEditingController skillContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Build Your',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Profile',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Enter your skills to improve match results.')),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Your linkedin URl')),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your linkedin profile'),
            ),
            Row(
              children: [
                Icon(Icons.assignment_turned_in_sharp),
                Text(
                  'Click here for your linkedIn profile',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            Row(children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('Skills'),
              ),
              Text(
                '(Ex:Java, businness strategy)',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ]),
            Flexible(
              child: Wrap(
                alignment: WrapAlignment.start,
                runSpacing: 20,
                spacing: 10,
                direction: Axis.horizontal,
                children: [
                  skillButton(width, height, skillContoller),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('Language'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(color: Colors.black.withOpacity(0.2))),
                  width: width * 0.29,
                  height: height * 0.05,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'First Language',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ])),
            ),
            Container(
              height: height * 0.06,
              width: width * 1,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 22),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  OutlinedButton skillButton(
      double width, double height, TextEditingController skillController) {
    return OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ))),
        onPressed: () {
          addSkillPopUp(context, height, skillController);
        },
        child: Container(
          width: width * 0.2,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.add_circle_rounded), Text('Add Skill')]),
        ));
  }

  addSkillPopUp(BuildContext context, double height,
      TextEditingController skillController) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            content: Container(
                width: double.maxFinite,
                height: height * 0.2,
                child: Expanded(
                  child: Column(
                    children: [
                      TextField(
                        controller: skillController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your linkedin profile'),
                      ),
                      ElevatedButton(onPressed: () {}, child: Text('Add'))
                    ],
                  ),
                )),
          );
        });
  }
}
