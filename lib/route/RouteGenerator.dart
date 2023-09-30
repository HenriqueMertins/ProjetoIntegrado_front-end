import 'package:flutter/material.dart';
import 'package:trainingcallendar/pages/pupil/my.date.dart';

import '../pages/choice.login.dart';
import '../pages/professor/login.page.professor.dart';
import '../pages/pupil/calendar.dart';
import '../pages/pupil/first.scene.dart';
import '../pages/pupil/login.page.pupil.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const choicePage());
      case "/loginProfessorPage":
        return MaterialPageRoute(
            settings: settings, builder: (_) => const LoginProfessorPage());
      case "/LoginPupilPage":
        return MaterialPageRoute(
            settings: settings, builder: (_) => const LoginPupilPage());
      case "/firstScenePupil":
        return MaterialPageRoute(
            settings: settings, builder: (_) => const choicePupil());
      case "/calendarPupil":
        return MaterialPageRoute(
            settings: settings, builder: (_) => const calendarPage());
      case "/myDatePupil":
        return MaterialPageRoute(
            settings: settings, builder: (_) => const myDate());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Erro'),
        ),
        body: const Center(
          child: Text('Página não encontrada!'),
        ),
      );
    });
  }
}
