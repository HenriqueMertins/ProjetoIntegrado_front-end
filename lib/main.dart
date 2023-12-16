import 'package:flutter/material.dart';
import 'package:trainingcallendar/route/RouteGenerator.dart';


void main() => runApp (const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Training Calendar',
      debugShowCheckedModeBanner: false,
      navigatorKey: GlobalKey<NavigatorState>(),
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 196, 190, 184)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

