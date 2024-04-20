import 'package:e_commerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bidding.dart';
import 'core/localization/localTranslation.dart';
import 'core/localization/translation.dart';
import 'core/services/my_services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //initialize service class, to can used my Services in my application,
  await MyServices().initializeService();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /* initialize my Local controller,
   to can i used the language  and change and controller it , in my application*/
    LocalLanguagesController controller = Get.put(LocalLanguagesController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:controller.appTheme,
      themeMode: ThemeMode.system,
     // darkTheme: controller.appThemeDark,
      translations: MyTransactions(),
      locale: controller.language,
      getPages: getPages,
      initialBinding: MyBidding(),
      //home: const MyTextProject()
    );
  }
}


