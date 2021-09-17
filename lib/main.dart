import 'package:flutter/material.dart';
import 'package:movie_app/utils/widgethelper/widget_helper.dart';
import 'package:movie_app/view/splash/splash_page.dart';

import 'constant/assets_const.dart';
import 'constant/color_const.dart';
import 'constant/string_const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SPManager.getThemeDark()
    return getView();
    // return
    //   ScopedModel(
    //   model: ThemeModel(),
    //   child: getView(),
    // );
  }

  Widget getView() {
    return MaterialApp(
      title: StringConst.APP_NAME,
      debugShowCheckedModeBanner: false,
      // darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        // brightness: isDarkMode() ? Brightness.dark : Brightness.light,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: AssetsConst.ZILLASLAB_FONT,
        accentColor: ColorConst.APP_COLOR,
      ),

      home: SplashPage(),
    );
  }
}
