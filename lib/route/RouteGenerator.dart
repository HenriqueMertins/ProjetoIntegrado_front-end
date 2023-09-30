import 'package:flutter/material.dart';

import '../pages/choice.login.dart';
import '../pages/login.page.dart';
import '../pages/pupil/calendar.dart';
import '../pages/pupil/first.scene.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const choicePage());
      case "/LoginScreen":
        return MaterialPageRoute(
            settings: settings, builder: (_) => const LoginPage());
      case "/choicePupil":
        return MaterialPageRoute(
            settings: settings, builder: (_) => const choicePupil());
      case "/calendarPage":
        return MaterialPageRoute(
            settings: settings, builder: (_) => const calendarPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Erro'),
        ),
        body: const Center(
          child: Text('Página não encontrada!'),
        ),
      );
    });
  }
}
