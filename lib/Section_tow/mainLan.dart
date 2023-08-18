import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'UI/home_changeLAn.dart';
import 'cubit/change_lan_cubit.dart';

void main() {
  runApp(const ChangeLanApp());
}

class ChangeLanApp extends StatelessWidget {
  const ChangeLanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) =>
      ChangeLanCubit()
        ..getSavedLanguage())
    ], child: BlocBuilder<ChangeLanCubit, ChangeLocaleState>(
      builder: (context, state) {
          return  MaterialApp(
            title: 'Localizations Sample App',
            debugShowCheckedModeBanner: false,
            locale: state.locale,
            home: HomePageChangeLan(),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            supportedLocales: [
              Locale('en'), // English
              Locale('ar'), // Arabic
            ],
          );
      },
    ),);
  }
}
