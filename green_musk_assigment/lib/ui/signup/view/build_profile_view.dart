import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_musk_assigment/ui/signup/controller/skill_controller.dart';

class BuildProfilePage extends ConsumerStatefulWidget {
  const BuildProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BuildProfilePageState();
}

final controller = ChangeNotifierProvider((ref) => SkillController());

class _BuildProfilePageState extends ConsumerState<BuildProfilePage> {
  TextEditingController skillController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var watch = ref.watch(controller);
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
            skillButton(width, height, skillController, watch),
            Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: watch.skillButtons),
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
            SizedBox(
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
    double width,
    double height,
    TextEditingController skillController,
    SkillController controller,
  ) {
    return OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ))),
        onPressed: () {
          addSkillPopUp(
            context,
            width,
            height,
            skillController,
            controller,
          );
        },
        child: SizedBox(
          width: width * 0.2,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.add_circle_rounded), Text('Add Skill')]),
        ));
  }

  addSkillPopUp(
    BuildContext context,
    double width,
    double height,
    TextEditingController skillController,
    SkillController controller,
  ) {
    List<bool> selectedLevel = List.generate(5, (index) => false);

    showDialog(
        context: context,
        builder: (builder) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Container(
                height: height * 0.3,
                width: width * 0.7,
                child: Column(
                  children: [
                    TextField(
                      controller: skillController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your linkedin profile'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  selectedLevel[0] = !selectedLevel[0];
                                  if (selectedLevel[0] == true) {
                                  } else {
                                    selectedLevel[0] = false;
                                    selectedLevel[1] = false;
                                    selectedLevel[2] = false;
                                    selectedLevel[3] = false;
                                    selectedLevel[4] = false;
                                  }
                                });
                              },
                              child: Container(
                                height: height * 0.03,
                                width: width * 0.09,
                                decoration: BoxDecoration(
                                    color: selectedLevel[0] == false
                                        ? Colors.grey
                                        : Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5),
                                        topLeft: Radius.circular(5))),
                              )),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedLevel[1] = !selectedLevel[1];
                                if (selectedLevel[1] == true) {
                                  selectedLevel[0] = true;
                                } else {
                                  selectedLevel[0] = false;
                                  selectedLevel[1] = false;
                                  selectedLevel[2] = false;
                                  selectedLevel[3] = false;
                                  selectedLevel[4] = false;
                                }
                              });
                            },
                            child: Container(
                              height: height * 0.03,
                              width: width * 0.09,
                              color: selectedLevel[1] == false
                                  ? Colors.grey
                                  : Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedLevel[2] = !selectedLevel[2];
                                if (selectedLevel[2] == true) {
                                  selectedLevel[0] = true;
                                  selectedLevel[1] = true;
                                } else {
                                  selectedLevel[0] = false;
                                  selectedLevel[1] = false;
                                  selectedLevel[2] = false;
                                  selectedLevel[3] = false;
                                  selectedLevel[4] = false;
                                }
                              });
                            },
                            child: Container(
                              height: height * 0.03,
                              width: width * 0.09,
                              color: selectedLevel[2] == false
                                  ? Colors.grey
                                  : Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedLevel[3] = !selectedLevel[3];
                                if (selectedLevel[3] == true) {
                                  selectedLevel[0] = true;
                                  selectedLevel[1] = true;
                                  selectedLevel[2] = true;
                                } else {
                                  selectedLevel[0] = false;
                                  selectedLevel[1] = false;
                                  selectedLevel[2] = false;
                                  selectedLevel[3] = false;
                                  selectedLevel[4] = false;
                                }
                              });
                            },
                            child: Container(
                              height: height * 0.03,
                              width: width * 0.09,
                              color: selectedLevel[3] == false
                                  ? Colors.grey
                                  : Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedLevel[4] = !selectedLevel[4];
                                if (selectedLevel[4] == true) {
                                  selectedLevel[0] = true;
                                  selectedLevel[1] = true;
                                  selectedLevel[2] = true;
                                  selectedLevel[3] = true;
                                } else {
                                  selectedLevel[0] = false;
                                  selectedLevel[1] = false;
                                  selectedLevel[2] = false;
                                  selectedLevel[3] = false;
                                }
                              });
                            },
                            child: Container(
                              height: height * 0.03,
                              width: width * 0.09,
                              decoration: BoxDecoration(
                                  color: selectedLevel[4] == false
                                      ? Colors.grey
                                      : Colors.blue,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(5),
                                      topRight: Radius.circular(5))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: width * 0.4,
                        height: height * 0.06,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey),
                            ),
                            onPressed: () {
                              setState(() {
                                var map = Map();

                                selectedLevel.forEach((element) {
                                  if (!map.containsKey(element)) {
                                    map[element] = 1;
                                  } else {
                                    map[element] += 1;
                                  }
                                });
                                if (map[true] == 5) {
                                  controller.skillButtonWidget(width, height,
                                      skillController.text, 'Expert');
                                } else if (map[true] == 4) {
                                  controller.skillButtonWidget(width, height,
                                      skillController.text, 'Proficient');
                                } else if (map[true] == 3) {
                                  controller.skillButtonWidget(width, height,
                                      skillController.text, 'Compotent');
                                } else if (map[true] == 2) {
                                  controller.skillButtonWidget(width, height,
                                      skillController.text, 'Beginner');
                                } else {
                                  controller.skillButtonWidget(width, height,
                                      skillController.text, 'Novice');
                                }
                              });
                            },
                            child: Text('Add')),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }
}
