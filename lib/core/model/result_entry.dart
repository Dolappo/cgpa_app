import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'result_entry.g.dart';


// class ResultEntry {
//
//   String? course;
//
//   double? score;
//
//   int? courseUnit;
//
//   int? gradePoint;
//   @HiveField(4)
//   Grade? grade;
//
//   ResultEntry({this.grade,
//     this.gradePoint,
//     this.courseUnit,
//     this.score,
//     this.course,
//   });
//
//   factory ResultEntry.fromJson(Map<String, dynamic> json) =>
//       ResultEntry(
//         course: json['course'] as String?,
//         score: json['score'] as double?,
//         courseUnit: json['courseUnit'] as int?,
//         gradePoint: json['gradePoint'] as int?,
//         grade: json['grade'] as Grade?,
//       );
//
//   Map<String, dynamic> toJson() =>
//       {
//         'course': course,
//         'score': score,
//         'courseUnit': courseUnit,
//         'gradePoint': gradePoint,
//         'grade': grade,
//       };
//
//   String get scoreGrade {
//     if (score! >= 70 && score! <= 100) {
//       return Grade.a.toEString();
//   }
//     else if(score! >= 60 && score! < 70){
//       return Grade.b.toEString();
//     }
//     else if(score!>= 50 && score!< 60){
//       return Grade.c.toEString();
//     }
//     else if(score! >= 45 && score! < 50){
//       return Grade.d.toEString();
//     }
//     else{
//       return Grade.f.toEString();
//     }
//   }
// }




enum Grade { a, b, c, d, f, g }

extension on Grade {
  toEString() {
    return name.toUpperCase();
  }
}
@HiveType(typeId: 0)
class ResultEntryBoxModel {
  @HiveField(0)
  String? courseName;
  @HiveField(1)
  String? grade;
  @HiveField(2)
  String? courseUnit;
  @HiveField(3)
  int? gradePoint;
  ResultEntryBoxModel({this.grade = 'A', this.courseUnit = '5', this.courseName, this.gradePoint});

  Map<String, dynamic> toJson()=>{
    'courseName': courseName,
    'grade': grade,
    'courseUnit': courseUnit,
    'gradePoint': gradePoint,
  };
}

