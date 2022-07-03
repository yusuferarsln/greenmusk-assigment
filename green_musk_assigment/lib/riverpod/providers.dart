import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_musk_assigment/riverpod/notifiers/skill_controller.dart';

final controller = ChangeNotifierProvider((ref) {
  return SkillController();
});
