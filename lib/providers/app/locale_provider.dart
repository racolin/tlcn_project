import 'dart:ui' as ui;

import '../../services/cache/cache.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocaleProvider with ChangeNotifier {
  /// Save locale
  Locale _locale = Locale(ui.window.locale.languageCode);

  /// Get current locale
  Locale get locale => _locale;

  void checkLocale(BuildContext context)async{
    String? locale =await Provider.of<Cache>(context, listen: false).getData("language");
    if(locale!=null && locale !='null'){
      _locale = Locale(locale);
    }else{
      _locale = Locale(ui.window.locale.languageCode);
    }
  }
  /// Update new locale
  set locale(Locale value) {
    _locale = value;
    notifyListeners();
  }
}
