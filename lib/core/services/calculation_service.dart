import '../model/result_entry.dart';
import 'package:stacked/stacked.dart';
class CalculationService {
  int totalCourseUnit = 0;
  int totalGradePoint = 0;
  int totalLoadUnit = 0;

List<ResultEntry> entries = [];
void setEntries(List<ResultEntry> studentEntries){
  entries = studentEntries;
  print(entries[0].scoreGrade);
}

void calculateTotalCourseUnit(){
  entries.map((e) {
    totalCourseUnit += e.courseUnit!;
  }).toList();
}

void calculateTotalLoadUnit(){
  entries.map((e) {
    totalLoadUnit += (e.gradePoint!*e.courseUnit!);
  }).toList();
}

void checkGrade(){
  entries.map((e) {
    if(e.scoreGrade=='A'){
      e.gradePoint=5;
    }
    else if(e.scoreGrade =='B'){
      e.gradePoint = 4;
    }
    else if(e.scoreGrade=='C'){
      e.gradePoint = 3;
    }
    else if(e.scoreGrade == 'D'){
      e.gradePoint = 2;
    }
    else{
      e.gradePoint=1;
    }
  }).toList();
}

}