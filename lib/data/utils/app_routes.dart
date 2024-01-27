import 'package:flutter/cupertino.dart';

import '../../ui/pages/chatPage/chat_page.dart';
import '../../ui/pages/language_page/language_page.dart';
import '../../ui/pages/login_page/login_page.dart';
import '../../ui/pages/register_page/register_page.dart';
import '../../ui/pages/splash_page/splash_page.dart';

class AppRoutes{
  static const String splashPage='/splashPage';
  static const String languagePage='/languagePage';
  static const String loginPage='/loginPage';
  static const String registerPage='/registerPage';
  static const String chatPage='/ChatPage';

  static Route<dynamic>? onGenerateRoute(settings){
    switch(settings.name){
      case AppRoutes.splashPage:return CupertinoPageRoute(builder: (context) => SplashPage());
      case AppRoutes.languagePage:return CupertinoPageRoute(builder: (context) => LanguagePage());
      case AppRoutes.loginPage:return CupertinoPageRoute(builder: (context) => LoginPage());
      case AppRoutes.registerPage:return CupertinoPageRoute(builder: (context) => RegisterPage());
      case AppRoutes.chatPage:return CupertinoPageRoute(builder: (context) => ChatPage());
    }
    return null;
  }
}