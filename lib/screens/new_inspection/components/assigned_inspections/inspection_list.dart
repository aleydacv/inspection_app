import 'package:flutter/material.dart';

class InspectionList extends StatelessWidget {
  const InspectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asignadas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          //width: 200,
          //height: 100,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20)),
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 35,
                //color: Color.fromARGB(255, 57, 164, 206),
                child: Center(child: Text('Entry aaaa')),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ),
    );
  }
}
