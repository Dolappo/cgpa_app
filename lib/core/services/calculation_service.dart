import '../model/result_entry.dart';
import 'package:stacked/stacked.dart';
class CalculationService {
  int totalCourseUnit = 0;
  int totalGradePoint = 0;
  int totalLoadUnit = 0;

List<ResultEntryBoxModel> entries = [];
void setEntries(List<ResultEntryBoxModel> boxEntries){
  entries = boxEntries;
  // print(entries[0].scoreGrade);
}

void calculateTotalCourseUnit(){
  totalCourseUnit = 0;
  entries.map((e) {
    totalCourseUnit += int.parse(e.courseUnit!);
  }).toList();
}

void calculateTotalLoadUnit(){
  totalLoadUnit = 0;
  entries.map((e) {
    totalLoadUnit += (e.gradePoint!*int.parse(e.courseUnit!));
  }).toList();
}

double getGpa(){
  double gpa = totalLoadUnit/totalCourseUnit;
  return gpa;
}
double calcGPA(){
  calculateTotalCourseUnit();
  checkGrade();
  calculateTotalLoadUnit();
  double gpa = getGpa();
  return gpa;
}

void checkGrade(){
  entries.map((e) {
    if(e.grade=='A'){
      e.gradePoint=5;
    }
    else if(e.grade =='B'){
      e.gradePoint = 4;
    }
    else if(e.grade=='C'){
      e.gradePoint = 3;
    }
    else if(e.grade == 'D'){
      e.gradePoint = 2;
    }
    else{
      e.gradePoint=1;
    }
  }).toList();
}

}