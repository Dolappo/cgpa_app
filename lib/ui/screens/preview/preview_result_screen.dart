import 'package:cgpa_app/ui/screens/preview/preview_entry_view_model.dart';
import 'package:cgpa_app/ui/widgets/result_entry_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
          ),
          body: Column(
            children: [
              Column(
                children: List.generate(model.entry.length, (index) => ResultEntryCard(isPreview: true,model: model.entry[index],)),
              )
            ],
          ),
        );
      }
    );
  }
}
