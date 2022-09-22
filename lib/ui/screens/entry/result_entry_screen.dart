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
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(model.studentEntries.length, (index) => ResultEntryCard(
                            onChangeCourseName: (value)=> model.onChangeCourseName(index, value),
                        onChangeCourseScore: (value)=> model.onChangeScore(index, value),
                        onChangeCourseUnit: (value)=> model.onChangeCourseUnit(index, value),
                        removeField:()=> model.removeEntry(index),
                      )),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  MaterialButton(height: 50, onPressed: ()=> model.addNewEntry(), child: const Text('Add New Entry'),),
                  MaterialButton(height: 50, onPressed:(){
                    model.submitEntries();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PreviewEntryScreen()));
                  }, color: Colors.blue, child: const Text('Preview Result'),)
                ],
              ),

            ],
          ),
        );
      }
    );
  }
}

class ShowBoxesScreen extends StatelessWidget {
  const ShowBoxesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResultEntryViewModel>.reactive(
        viewModelBuilder: () => ResultEntryViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('GPA Calculator'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                        children: List.generate(
                            model.boxEntries.length,
                                (index) => CResultEntryBox(
                                gradeValue: model.boxEntries[index].grade,
                                unitValue: model.boxEntries[index].courseUnit,
                                grades: model.grades,
                                units: model.units,
                                onChangedGrades: (value) =>
                                    model.onChangedGrades(value, index),
                                onChangedCourseName: (value) =>
                                    model.onChangedCourseName(value, index),
                                removeBox: () => model.removeEntryBox(index),
                                onChangedUnits: (value) =>
                                    model.onChangedUnits(value, index)))),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MaterialButton(
                        onPressed: () => model.addNewBox(),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: const [
                                Text('Add Course'),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
