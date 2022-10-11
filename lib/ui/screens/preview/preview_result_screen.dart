import 'package:cgpa_app/ui/screens/preview/preview_entry_view_model.dart';
import 'package:cgpa_app/ui/widgets/result_entry_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../util/color.dart';
class PreviewEntryScreen extends StatelessWidget {
  const PreviewEntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PreviewEntryViewModel>.reactive(
      onModelReady: (model)=> model.getEntries(),
      viewModelBuilder: ()=> PreviewEntryViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Preview Result'),
            backgroundColor: EColor.primaryColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Course', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Unit', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Grade', textAlign: TextAlign.center),
                    )
                  ],
                ),
                Table(
                  border: TableBorder.all(color: Colors.black),
                  textBaseline: TextBaseline.alphabetic,
                  children: List.generate(model.entry.length, (index) => TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(model.entry[index].courseName??'-', textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(model.entry[index].courseUnit??'-', textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(model.entry[index].grade??'-', textAlign: TextAlign.center),
                      ),
                    ]
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('GPA', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(model.getGPA(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                    )
                  ],

                  ),
                )

              ],
            ),
          ),
        );
      }
    );
  }
}
