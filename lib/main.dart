import 'package:flutter/material.dart';
import 'package:otoo/boarding_screen/view/starting_screen.dart';
import 'package:otoo/home/controller/provider/local_function_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => LocalFunctionsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // useMaterial3: true,
            ),
        home: const StartingScreen(),
      ),
    );
  }
}
