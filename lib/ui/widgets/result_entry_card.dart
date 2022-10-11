import 'package:cgpa_app/ui/screens/entry/result_entry_view_model.dart';
import 'package:cgpa_app/util/color.dart';
import 'package:flutter/material.dart';
import '../../core/model/result_entry.dart';
import 'c_textfield.dart';
import 'package:stacked/stacked.dart';

import 'drop_down.dart';

class CResultEntryBox extends StatefulWidget {
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
  State<CResultEntryBox> createState() => _CResultEntryBoxState();
}

class _CResultEntryBoxState extends State<CResultEntryBox> {
  Color color =  Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(10),
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
                      onChanged: widget.onChangedCourseName,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: CDropDown(
                          dropDownItems: widget.grades,
                          onChanged: widget.onChangedGrades,
                          dropDownValue: widget.gradeValue,
                              hint: 'Grade',
                        )),
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                            child: CDropDown(
                              hint: 'Units',
                          dropDownItems: widget.units,
                          onChanged: widget.onChangedUnits,
                          dropDownValue: widget.unitValue,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: widget.removeBox, icon: const Icon(Icons.close, size: 18,)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PreviewResultCard extends StatelessWidget {
  final ResultEntryBoxModel? model;
  final bool isHeader;
  const PreviewResultCard(
      {Key? key, this.model, this.isHeader = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: Text(isHeader?'Course':model?.courseName ?? '-', textAlign: TextAlign.center,style: TextStyle(fontSize: isHeader?20:14),)),
          Expanded(child: Text(isHeader?'Unit':model?.courseUnit ?? '-', textAlign: TextAlign.center, style: TextStyle(fontSize: isHeader?20:14))),
          Expanded(child: Text(isHeader?'Grade': model?.grade ?? '-', textAlign: TextAlign.center, style: TextStyle(fontSize: isHeader?20:14))),
        ],
      ),
    );
  }
}
