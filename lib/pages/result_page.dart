import 'package:bmi/models/person.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final List<Person> results;
  const ResultPage({super.key, required this.results});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 136, 136, 255),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 51, 51, 182),
            title: const Text(
              'Resultado do IMC',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
              itemCount: widget.results.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(widget.results[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Idade: ${widget.results[index].age}"),
                        Text("Altura: ${widget.results[index].height}"),
                        Text("Peso: ${widget.results[index].weight}"),
                        Text(
                            "IMC: ${widget.results[index].bmi.toStringAsFixed(2)}"),
                        Text(
                            "Diagnóstico:  ${widget.results[index].diagnostic}")
                      ],
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
