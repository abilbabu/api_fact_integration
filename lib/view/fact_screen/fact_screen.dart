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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<FactsScreenController>().getFacts();
        },
      ),
      body: Consumer<FactsScreenController>(
        builder: (context, factsprovider, child) => ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(factsprovider.dataList![index].fact ?? "no data"),
              );
            },
            itemCount: factsprovider.dataList?.length),
     ),
);
}
}