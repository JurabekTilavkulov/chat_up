import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalController extends GetxController{

  var _locale=Get.deviceLocale!.obs;  // field boshlangich default xolatda devices language ga otadi

  GetStorage box=GetStorage(); //

  Rx<Locale> get locale => _locale;  // getter

  changeLanguage(Locale locale){     //function
    _locale.value=locale;
    box.write('locale', '${locale.languageCode}_${locale.countryCode}');  //tanlov xotirada saqlanadi
    Get.updateLocale(locale);
  }
// bu Overrideni xosil qilish uchun CTRL+O bosiladi
  @override
  void onInit() {

    if(box.read('locale')!=null){
      String locale=box.read('locale'); // xotirada saqlangan bo'lsa o'qib olish
      _locale.value=Locale(locale.split('_')[0],locale.split('_')[1]); //bu yerda
      // saqlangan uz_UZ ni language code bilan country codini ajratib, Locale ni
      // talab qilgan standarti bo'yicha kiritamiz
    }
    else{   // agar xotirada saqlanmagan bolsa, qurilma tilidan malumot ol.inadi
      _locale.value=Get.deviceLocale!;
    }

    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
  }
}