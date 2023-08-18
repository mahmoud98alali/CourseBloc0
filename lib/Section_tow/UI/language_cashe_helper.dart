
import 'package:shared_preferences/shared_preferences.dart';
class LanguageCacheHelper
{

  Future<void> cacheLanguageCode (String languageCode) async{
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LOCALE",languageCode);
  }

  Future<String> getCacheLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cacheLanguageCode = sharedPreferences.getString("LOCALE");
    if(cacheLanguageCode != null){
      return cacheLanguageCode;
    }else{
      return "en";
    }
  }

}