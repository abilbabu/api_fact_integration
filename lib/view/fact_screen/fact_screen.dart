import 'package:api_fact_integration/controller/facts_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FactsScreen extends StatefulWidget {
  const FactsScreen({super.key});

  @override
  State<FactsScreen> createState() => _FactsScreenState();
}

class _FactsScreenState extends State<FactsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context.read<FactsScreenController>().getFacts(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FactsScreenController>(
        builder: (context, factsScreenControllerObj, child) => ListView.builder(
          itemBuilder: (context, index) => Container(
            child: ListTile(
              leading: Text(
                  factsScreenControllerObj.dataList[index].length.toString()),
              title: Text(
                  factsScreenControllerObj.dataList[index].fact.toString()),
            ),
          ),
          itemCount: factsScreenControllerObj.dataList.length,
        ),
      ),
    );
  }
}
