import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:note_3/core/consts/strings.dart';
import 'package:note_3/core/helper/cache_helper.dart';
import 'package:note_3/generated/l10n.dart';

part 'change_lanuage_state.dart';

class ChangeLanuageCubit extends Cubit<Locale> {
  ChangeLanuageCubit(Locale initialState) : super(initialState);

  ///update language
  updateLang(BuildContext context) async {
    Locale? locale;
    try {
      ///get current lang
      locale = Intl.getCurrentLocale() == 'ar'
          ? const Locale('en')
          : const Locale('ar');

      ///updated language
      S.load(locale);

      ///save lanugae to Cache
      await CacheHelper.saveData(
        key: StringsEn.lang,
        value: Intl.getCurrentLocale(),
      );

      ///emit updated
      emit(locale);
    } catch (e) {
      print(e.toString());
    }
  }
}
