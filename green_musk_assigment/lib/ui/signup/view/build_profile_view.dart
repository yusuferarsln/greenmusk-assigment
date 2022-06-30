import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_musk_assigment/ui/signup/controller/skill_controller.dart';
import 'package:green_musk_assigment/ui/signup/widgets/inputchipmodel.dart';

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
    var title = ref.read(controller).title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var watch = ref.watch(controller);

    return SafeArea(
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
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('Skills'),
              ),
              Text(
                '(Ex:Java, businness strategy)',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 10,
                    children: watch.chipList
                        .map((chip) => Chip(
                              label: Text(chip.name),
                              backgroundColor: Colors.blue,
                              onDeleted: () {
                                setState(() {
                                  watch.deleteChips(chip.id);
                                });
                              },
                            ))
                        .toList(),
                  ),
                ),
                watch.chipList.isEmpty
                    ? Align(
                        alignment: Alignment.bottomLeft,
                        child: skillButton(
                          'First Skill',
                          width,
                          height,
                          skillController,
                          watch,
                        ))
                    : Align(
                        alignment: Alignment.bottomLeft,
                        child: skillButton(
                          'Add Skill',
                          width,
                          height,
                          skillController,
                          watch,
                        ))
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('Language'),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 10,
                children: watch.languageChipList
                    .map((chip) => Chip(
                          label: Text(chip.name),
                          backgroundColor: Colors.blue,
                          onDeleted: () {
                            setState(() {
                              watch.languageDeleteChips(chip.id);
                            });
                          },
                        ))
                    .toList(),
              ),
            ),
            watch.languageChipList.isEmpty
                ? Align(
                    alignment: Alignment.bottomLeft,
                    child: languageButton(
                      'First Language',
                      width,
                      height,
                      skillController,
                      watch,
                    ))
                : Align(
                    alignment: Alignment.bottomLeft,
                    child: languageButton(
                      'Add Language',
                      width,
                      height,
                      skillController,
                      watch,
                    )),
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
    String buttonText,
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
          addSkillPopUp(context, width, height, skillController, controller, 0);
        },
        child: SizedBox(
          width: width * 0.2,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.add_circle_rounded), Text(buttonText)]),
        ));
  }

  OutlinedButton languageButton(
    String buttonText,
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
          addSkillPopUp(context, width, height, skillController, controller, 1);
        },
        child: SizedBox(
          width: width * 0.3,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.add_circle_rounded),
            SizedBox(
              width: 10,
            ),
            Text(buttonText)
          ]),
        ));
  }

  addSkillPopUp(
    BuildContext context,
    double width,
    double height,
    TextEditingController skillController,
    SkillController controller,
    int id,
  ) {
    List<bool> selectedLevel = List.generate(5, (index) => false);
    var map = Map();

    String? title;

    id == 0
        ? showDialog(
            context: context,
            builder: (builder) {
              return StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                  content: Container(
                    height: height * 0.35,
                    width: width * 0.7,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.grey.withOpacity(0.6),
                              ),
                            )),
                        Text(
                          'Add a Skill',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Input a skill')),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: skillController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                hintText: 'Ex : Java'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Novice',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedLevel[0] = !selectedLevel[0];
                                      if (selectedLevel[0] == true) {
                                        controller.adTitle('Novice');
                                      } else {
                                        selectedLevel[0] = false;
                                        selectedLevel[1] = false;
                                        selectedLevel[2] = false;
                                        selectedLevel[3] = false;
                                        selectedLevel[4] = false;
                                        controller.adTitle('Select Level');
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.03,
                                    width: width * 0.07,
                                    decoration: BoxDecoration(
                                        color: selectedLevel[0] == false
                                            ? Colors.grey
                                            : Colors.blue,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            topLeft: Radius.circular(10))),
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
                                      controller.adTitle('Beginner');
                                    } else {
                                      selectedLevel[0] = false;
                                      selectedLevel[1] = false;
                                      selectedLevel[2] = false;
                                      selectedLevel[3] = false;
                                      selectedLevel[4] = false;
                                      controller.adTitle('Select Level');
                                    }
                                  });
                                },
                                child: Container(
                                  height: height * 0.03,
                                  width: width * 0.07,
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
                                      controller.adTitle('Compotent');
                                      selectedLevel[0] = true;
                                      selectedLevel[1] = true;
                                    } else {
                                      selectedLevel[0] = false;
                                      selectedLevel[1] = false;
                                      selectedLevel[2] = false;
                                      selectedLevel[3] = false;
                                      selectedLevel[4] = false;
                                      controller.adTitle('Select Level');
                                    }
                                  });
                                },
                                child: Container(
                                  height: height * 0.03,
                                  width: width * 0.07,
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
                                      controller.adTitle('Proficient');
                                    } else {
                                      selectedLevel[0] = false;
                                      selectedLevel[1] = false;
                                      selectedLevel[2] = false;
                                      selectedLevel[3] = false;
                                      selectedLevel[4] = false;
                                      controller.adTitle('Select Level');
                                    }
                                  });
                                },
                                child: Container(
                                  height: height * 0.03,
                                  width: width * 0.07,
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
                                      controller.adTitle('Expert');
                                    } else {
                                      selectedLevel[0] = false;
                                      selectedLevel[1] = false;
                                      selectedLevel[2] = false;
                                      selectedLevel[3] = false;
                                      controller.adTitle('Select Level');
                                    }
                                  });
                                },
                                child: Container(
                                  height: height * 0.03,
                                  width: width * 0.07,
                                  decoration: BoxDecoration(
                                      color: selectedLevel[4] == false
                                          ? Colors.grey
                                          : Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Expert',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        controller.title == null
                            ? Text('Select level')
                            : Text(controller.title.toString()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: width * 0.4,
                            height: height * 0.06,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: skillController.text ==
                                                "" ||
                                            controller.title == null
                                        ? MaterialStateProperty.all(Colors.grey)
                                        : MaterialStateProperty.all(
                                            Colors.blue)),
                                onPressed: () {
                                  setState(() {
                                    if (skillController.text == "" ||
                                        controller.title == null) {
                                    } else {
                                      var map = Map();

                                      selectedLevel.forEach((element) {
                                        if (!map.containsKey(element)) {
                                          map[element] = 1;
                                        } else {
                                          map[element] += 1;
                                        }
                                      });

                                      if (map[true] == 5) {
                                        controller.chipAdd(
                                            DateTime.now.toString(),
                                            skillController.text,
                                            'Expert');
                                      } else if (map[true] == 4) {
                                        controller.chipAdd(
                                            DateTime.now.toString(),
                                            skillController.text,
                                            'Proficient');
                                        controller.title = 'Proficient';
                                      } else if (map[true] == 3) {
                                        controller.chipAdd(
                                            DateTime.now.toString(),
                                            skillController.text,
                                            'Compotent');
                                        controller.title = 'Compotent';
                                      } else if (map[true] == 2) {
                                        controller.chipAdd(
                                            DateTime.now.toString(),
                                            skillController.text,
                                            'Beginner');
                                        controller.title = 'Beginner';
                                      } else {
                                        controller.chipAdd(
                                            DateTime.now.toString(),
                                            skillController.text,
                                            'Novice');
                                        controller.title = 'Novice';
                                      }
                                      skillController.text = "";
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
            })
        : showDialog(
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
                              hintText: 'Ex : English'),
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
                                  var map = Map();

                                  selectedLevel.forEach((element) {
                                    if (!map.containsKey(element)) {
                                      map[element] = 1;
                                    } else {
                                      map[element] += 1;
                                    }
                                  });

                                  if (map[true] == 5) {
                                  } else if (map[true] == 4) {
                                    controller.languageChipAdd(
                                        DateTime.now.toString(),
                                        skillController.text,
                                        'Proficient');
                                  } else if (map[true] == 3) {
                                    controller.languageChipAdd(
                                        DateTime.now.toString(),
                                        skillController.text,
                                        'Compotent');
                                  } else if (map[true] == 2) {
                                    controller.languageChipAdd(
                                        DateTime.now.toString(),
                                        skillController.text,
                                        'Beginner');
                                  } else {
                                    controller.languageChipAdd(
                                        DateTime.now.toString(),
                                        skillController.text,
                                        'Novice');
                                  }
                                  skillController.text = "";
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
