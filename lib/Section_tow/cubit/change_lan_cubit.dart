import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../UI/language_cashe_helper.dart';

part 'change_lan_state.dart';

class ChangeLanCubit extends Cubit<ChangeLocaleState> {
  ChangeLanCubit() : super(ChangeLocaleState(locale: const Locale('en')));

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCacheLanguageCode();

    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
