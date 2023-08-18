import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/change_lan_cubit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            BlocBuilder<ChangeLanCubit, ChangeLocaleState>(
              builder: (context, state) {

                  return DropdownButton<String>(
                      value: state.locale.languageCode,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: ['ar', 'en'].map((String items) {
                        return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items));
                      }).toList(), onChanged: (String? newValue) {

                       if(newValue != null){
                         BlocProvider.of<ChangeLanCubit>(context).changeLanguage(newValue);
                       }

                  });

              },
            ),
          ],
        ),
      ),
    );
  }
}
