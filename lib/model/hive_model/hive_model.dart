import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class HiveModel extends HiveObject {
  @HiveField(0)
  bool? isCorrect;

  @HiveField(1)
  String? correctCount;

  @HiveField(2)
  String? wrongAnswers;

  @HiveField(3)
  int? key;
  HiveModel({
    required this.isCorrect,
    // required this.correctCount,
    // required this.wrongAnswers,
  });
}
