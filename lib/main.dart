import 'package:api_fact_integration/controller/facts_screen_controller.dart';
import 'package:api_fact_integration/view/fact_screen/fact_screen.dart';
import 'package:flutter/material.dart';
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
        ChangeNotifierProvider(create: (context) => FactsScreenController(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FactsScreen(),
      ),
    );
  }
}
