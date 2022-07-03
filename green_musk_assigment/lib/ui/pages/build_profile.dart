import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:green_musk_assigment/core/constants/colors.dart';
import 'package:green_musk_assigment/riverpod/providers.dart';
import 'package:green_musk_assigment/ui/widgets/add_language.dart';
import 'package:green_musk_assigment/ui/widgets/add_skill.dart';
import 'package:green_musk_assigment/ui/widgets/header_widget.dart';

class BuildProfile extends StatefulWidget {
  const BuildProfile({Key? key}) : super(key: key);

  @override
  State<BuildProfile> createState() => _BuildProfileState();
}

class _BuildProfileState extends State<BuildProfile> {
  TextEditingController skillController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Material(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(children: [
                headerWidget(height: height, width: width),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter your skills to improve match results.',
                      style: TextStyle(
                          color: headOne.withOpacity(0.7), fontSize: 14),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your linkedin URl',
                      style: TextStyle(
                        color: headTwo,
                        fontSize: 14,
                      ),
                    )),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: linkedinController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: 'Enter your linkedin profile',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: backLink,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Click here for your linkedIn profile',
                      style: TextStyle(
                          color: backLink,
                          decoration: TextDecoration.underline,
                          fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Skills',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    '(Ex:Java, businness strategy)',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                ]),
                Consumer(builder: (BuildContext context, WidgetRef ref, child) {
                  var watch = ref.watch(controller);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 10,
                          children: watch.chipList
                              .map((chip) => Chip(
                                    label: Text(
                                      chip.name + ' - ' + chip.title,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: backLink,
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
                          ? addSkillButtonWidget(
                              width: width,
                              height: height,
                              controller: watch,
                              textController: skillController,
                              id: 0,
                              buttonText: 'First Skill',
                            )
                          : addSkillButtonWidget(
                              width: width,
                              height: height,
                              controller: watch,
                              textController: skillController,
                              id: 0,
                              buttonText: 'Add Skill',
                            )
                    ],
                  );
                }),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Language'),
                ),
                Consumer(builder: (BuildContext context, WidgetRef ref, child) {
                  var watch = ref.watch(controller);

                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 10,
                          children: watch.languageChipList
                              .map((chip) => Chip(
                                    label: Text(
                                      chip.name + ' - ' + chip.title,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: backLink,
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
                          ? addLanguageButtonWidget(
                              width: width,
                              height: height,
                              controller: watch,
                              textController: skillController,
                              id: 1,
                              buttonText: 'First Language',
                            )
                          : addLanguageButtonWidget(
                              width: width,
                              height: height,
                              controller: watch,
                              textController: skillController,
                              id: 1,
                              buttonText: 'Add Language',
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      linkedinController.text != null &&
                              watch.chipList.isNotEmpty &&
                              watch.languageChipList.isNotEmpty
                          ? SizedBox(
                              height: height * 0.06,
                              width: width * 1,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  'Get Started',
                                  style: TextStyle(fontSize: 22),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(backLink),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: height * 0.06,
                              width: width * 1,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  'Get Started',
                                  style: TextStyle(fontSize: 22),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.grey),
                                ),
                              ),
                            )
                    ],
                  );
                })
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
