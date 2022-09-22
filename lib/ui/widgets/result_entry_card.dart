import 'package:cgpa_app/ui/screens/entry/result_entry_view_model.dart';
import 'package:flutter/material.dart';
import '../../core/model/result_entry.dart';
import 'c_textfield.dart';
import 'package:stacked/stacked.dart';

import 'drop_down.dart';

class ResultEntryCard extends StatelessWidget {
  final ResultEntry? model;
  final bool isPreview;
  final void Function()? removeField;
  final bool isHeader;
  final void Function(String?)? onChangeCourseName;
  final void Function(String?)? onChangeCourseScore;
  final void Function(String?)? onChangeCourseUnit;
  const ResultEntryCard({
    Key? key,
    this.removeField,
    this.isPreview = false,
    this.model,
    this.isHeader = false,
    this.onChangeCourseName,
    this.onChangeCourseScore,
    this.onChangeCourseUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isPreview
        ? Row(
            children: [
              Expanded(
                flex: 2,
                child: isHeader
                    ? const Text('Course name')
                    : CTextField(
                        onChanged: onChangeCourseName,
                        hintText: 'Course name',
                      ),
              ),
              Expanded(
                child: isHeader
                    ? const Text('Units')
                    : CTextField(
                        onChanged: onChangeCourseUnit!,
                        hintText: 'Course unit',
                        keyboardType: TextInputType.phone,
                      ),
              ),
              Expanded(
                child: isHeader
                    ? const Text('Score')
                    : CTextField(
                        onChanged: onChangeCourseScore!,
                        hintText: 'Score',
                        keyboardType: TextInputType.phone,
                      ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: removeField,
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text(isHeader ? 'Course Name' : model?.course ?? '-')),
              Expanded(
                  child: Text(
                      isHeader ? 'Unit' : model?.courseUnit.toString() ?? '-')),
              Expanded(
                  child: Text(
                      isHeader ? 'Score' : model?.score.toString() ?? '-')),
              if (isPreview)
                Expanded(
                  child: Text(isHeader ? 'Grade' : model?.scoreGrade ?? '-'),
                ),
            ],
          );
  }
}


class CResultEntryBox extends StatelessWidget {
  final List<String> grades;
  final List<String> units;
  final dynamic gradeValue;
  final dynamic unitValue;
  final void Function(dynamic) onChangedGrades;
  final void Function(dynamic) onChangedUnits;
  final void Function(String?)? onChangedCourseName;
  final void Function()? removeBox;
  const CResultEntryBox(
      {Key? key,
      required this.grades,
      required this.gradeValue,
      required this.unitValue,
      this.removeBox,
      required this.units,
      required this.onChangedGrades,
      required this.onChangedCourseName,
      required this.onChangedUnits})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    CTextField(
                      hintText: 'Course name',
                      onChanged: onChangedCourseName,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: CDropDown(
                          dropDownItems: grades,
                          onChanged: onChangedGrades,
                          dropDownValue: gradeValue,
                        )),
                        const SizedBox(width: 40,),
                        Expanded(
                            child: CDropDown(
                          dropDownItems: units,
                          onChanged: onChangedUnits,
                          dropDownValue: unitValue,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(onPressed: removeBox, icon: const Icon(Icons.close)),
            ],
          ),
        ),
      ),
    );
  }
}

