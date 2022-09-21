import 'package:flutter/material.dart';
import '../../core/model/result_entry.dart';
import 'c_textfield.dart';

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
                child:isHeader?Text('Course name'): CTextField(
                  onChanged: onChangeCourseName,
                  hintText: 'Course name',
                ),
              ),
              Expanded(
                child: isHeader?Text('Units'): CTextField(
                  onChanged: onChangeCourseUnit!,
                  hintText: 'Course unit',
                  keyboardType: TextInputType.phone,
                ),
              ),
              Expanded(
                child: isHeader?Text('Score'): CTextField(
                  onChanged: onChangeCourseScore!,
                  hintText: 'Score',
                  keyboardType: TextInputType.phone,
                ),
              ),
              IconButton(icon: Icon(Icons.close), onPressed: removeField,),
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
              if(isPreview)
              Expanded(
                child: Text(isHeader
                    ? 'Grade'
                    : model?.scoreGrade?? '-'),
              ),
            ],
          );
  }
}
