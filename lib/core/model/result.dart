import 'package:cgpa_app/core/model/result_entry.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'result.g.dart';

@HiveType(typeId: 0)
class Result {
  @HiveField(0)
  double? gpa;
  @HiveField(1)
  List<ResultEntryBoxModel>? result;
  @HiveField(2)
  int? year;
  @HiveField(3)
  int? semester;
  @HiveField(4)
  String? studentName;
  @HiveField(5)
  String? username;
  Result({this.year, this.semester, this.studentName, this.gpa, this.result, this.username});
}
