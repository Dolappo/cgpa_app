import 'package:cgpa_app/core/services/calculation_service.dart';
import 'package:cgpa_app/core/services/local_storage_service.dart';
import 'package:cgpa_app/core/services/user_repo.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:stacked/stacked.dart';

import '../../../app/app_setup.locator.dart';
import '../../../core/model/result.dart';
import '../../../core/model/result_entry.dart';
class PreviewEntryViewModel extends BaseViewModel{
final _calcService = locator<CalculationService>();
final _storage = locator<LocalStorageService>();
// final _user = locator<UserRepo>();
List<ResultEntryBoxModel> _entry = [];
List<ResultEntryBoxModel> get entry => _entry;
String gpa = '';
int semester = 0;
int year = 0;
void getEntries(){
  _entry = _calcService.entries;
  print('Preview: ${_entry[0].grade}');
  notifyListeners();
}

String getGPA(){
  gpa = _calcService.calcGPA().toStringAsFixed(2);
  notifyListeners();
  return gpa;
}


//
// Future<void> downloadAsPDF() async{
//   final doc = pw.Document();
//   doc.addPage(pw.Page(pageFormat: PdfPageFormat.a4, build: (pw.Context context){
//     return doc;
//   }));
//   await Printing.layoutPdf(
//
//   );
// }
// void saveResult(){
//   Result result = Result(
//     gpa: double.parse(gpa),
//     result: _entry,
//     semester: semester,
//     studentName: _user.fullName,
//     year:year,
//   );
//   _storage.saveResult(result);
// }

}