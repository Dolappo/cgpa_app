import 'package:cgpa_app/core/services/calculation_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app_setup.locator.dart';
import '../../../core/model/result_entry.dart';
class ResultEntryViewModel extends BaseViewModel{
  final _calcService = locator<CalculationService>();
List<ResultEntry> _studentEntries = [];

List<ResultEntry> get studentEntries => _studentEntries;

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
  print('course score: $value');
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