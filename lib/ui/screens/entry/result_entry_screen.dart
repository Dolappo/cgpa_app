import 'package:cgpa_app/ui/screens/entry/result_entry_view_model.dart';
import 'package:cgpa_app/ui/screens/preview/preview_result_screen.dart';
import 'package:cgpa_app/ui/widgets/result_entry_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ResultEntryScreen extends StatelessWidget {
  const ResultEntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResultEntryViewModel>.reactive(
      viewModelBuilder: ()=> ResultEntryViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          body: Column(
            children:  [
              const ResultEntryCard(isPreview: false, isHeader: true,),
              Expanded(
                child: Column(
                  children: List.generate(model.studentEntries.length, (index) => ResultEntryCard(
                        onChangeCourseName: (value)=> model.onChangeCourseName(index, value),
                    onChangeCourseScore: (value)=> model.onChangeScore(index, value),
                    onChangeCourseUnit: (value)=> model.onChangeCourseUnit(index, value),
                    removeField:()=> model.removeEntry(index),
                  )),
                ),
              ),
              MaterialButton(height: 50, onPressed: ()=> model.addNewEntry(), child: const Text('Add New Entry'),),
              MaterialButton(height: 50, onPressed:(){
                model.submitEntries();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> PreviewEntryScreen()));
              }, color: Colors.blue, child: const Text('Preview Result'),)
            ],
          ),
        );
      }
    );
  }
}
