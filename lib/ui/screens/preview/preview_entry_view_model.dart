import 'package:cgpa_app/core/services/calculation_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app_setup.locator.dart';
import '../../../core/model/result_entry.dart';
class PreviewEntryViewModel extends BaseViewModel{
final _calcService = locator<CalculationService>();
List<ResultEntry> _entry = [];
List<ResultEntry> get entry => _entry;
void getEntries(){
  _entry = _calcService.entries;
  print('Preview: ${_entry[0].course}');
  notifyListeners();
}

String getGPA(){
  return _calcService.calcGPA().toStringAsFixed(2);
}

}