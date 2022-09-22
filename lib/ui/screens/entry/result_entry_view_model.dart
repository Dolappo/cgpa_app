import 'package:cgpa_app/core/services/calculation_service.dart';
import 'package:cgpa_app/ui/screens/entry/result_entry_screen.dart';
import 'package:cgpa_app/ui/widgets/result_entry_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app_setup.locator.dart';
import '../../../core/model/result_entry.dart';
class ResultEntryViewModel extends BaseViewModel{
  final _calcService = locator<CalculationService>();
List<ResultEntry> _studentEntries = [];

List<ResultEntryBoxModel> _boxEntries = [];

List<ResultEntryBoxModel> get boxEntries => _boxEntries;

List<ResultEntry> get studentEntries => _studentEntries;

List<String> _grades = [
  'A',
  'B',
  'C',
  'D',
  'F'
];

List<String> _units = [
  '5',
  '4',
  '3',
  '2',
  '1',
];

List<String> get units => _units;
List<String> get grades => _grades;

void onChangedGrades(value, index){
  _boxEntries[index].grade = value;
  notifyListeners();
}

void onChangedUnits(value, index){
  _boxEntries[index].courseUnit
  = value;
  notifyListeners();
}

void onChangedCourseName(value, index){
  _boxEntries[index].courseName = value;
  notifyListeners();
}

void removeEntryBox(int index){
  _boxEntries.removeAt(index);
  notifyListeners();
}

void addNewBox(){
  _boxEntries.add(ResultEntryBoxModel());
  notifyListeners();
}

void onChangeCourseName(int index, value){
  print('course name: $value');
  _studentEntries[index].course = value;
  notifyListeners();
}
void onChangeCourseUnit(int index, value){
  print('course unit: $value');
  _studentEntries[index].courseUnit = int.parse(value);
  notifyListeners();
}
void onChangeScore(int index, value){
  print('course scores: $value');
  _studentEntries[index].score = double.parse(value);
  notifyListeners();
}

void addNewEntry(){
  _studentEntries.add(ResultEntry());
  notifyListeners();
}

void removeEntry(index){
  _studentEntries.removeAt(index);
  notifyListeners();
}

void submitEntries(){
  _calcService.setEntries(_studentEntries);
}

}