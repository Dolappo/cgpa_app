import 'package:cgpa_app/core/services/calculation_service.dart';
import 'package:cgpa_app/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';



@StackedApp(
  routes: [

  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: CalculationService),
    LazySingleton(classType: LocalStorageService),
  ],
)
class $AppSetup {}
