import 'package:flutter/material.dart';
import 'package:trainingcallendar/pages/professor/InfoPupil.dart';
import 'package:trainingcallendar/pages/professor/ListPupil.dart';
import 'package:trainingcallendar/pages/professor/RegisterPupil.dart';
import 'package:trainingcallendar/pages/professor/RegisterTraining.dart';
import 'package:trainingcallendar/pages/pupil/MyProfessor.dart';
import 'package:trainingcallendar/pages/pupil/myDate.dart';

import '../pages/choiceLogin.dart';
import '../pages/professor/choiceProfessor.dart';
import '../pages/professor/loginProfessor.dart';
import '../pages/pupil/calendar.dart';
import '../pages/pupil/choicePupil.dart';
import '../pages/pupil/loginPupil.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ChoicePage());
            // settings: settings, builder: (_) => const ListPupil());
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
            settings: settings, builder: (_) => const myDate()); //ta errado
      case "/choiceProfessor":
        return MaterialPageRoute(
            settings: settings, builder: (_) => const choiceProfessor());
      case "/RegisterPupil":
        return MaterialPageRoute(
            settings: settings, builder: (_) => const RegisterPupil());
      case "/ListPupil":
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ListPupil());
      case "/MyProfessor":
        return MaterialPageRoute(
            settings: settings, builder: (_) => const MyProfessor());
      case "/RegisterTraining":
        return MaterialPageRoute(
            settings: settings, builder: (_) => const RegisterTraining());
      case "/InfoPupil":
        return MaterialPageRoute(
            settings: settings, builder: (_) => const InfoPupil());
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
