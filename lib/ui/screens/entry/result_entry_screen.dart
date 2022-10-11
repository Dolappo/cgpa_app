import 'package:cgpa_app/ui/screens/entry/result_entry_view_model.dart';
import 'package:cgpa_app/ui/screens/preview/preview_result_screen.dart';
import 'package:cgpa_app/ui/widgets/result_entry_card.dart';
import 'package:cgpa_app/util/color.dart';
import 'package:cgpa_app/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
class ShowBoxesScreen extends StatelessWidget {
  const ShowBoxesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResultEntryViewModel>.reactive(
        viewModelBuilder: () => ResultEntryViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text('GPA Calculator', style: MyStyles.style1,),
              backgroundColor: EColor.primaryColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 150,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.grey)
                          ),
                          onPressed: () => model.addNewBox(),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: (){
                        model.submitEntries();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> PreviewEntryScreen()));},
                      color: EColor.primaryColor,
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('Preview Result', style: TextStyle(color: Colors.white),),
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
