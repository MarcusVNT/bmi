import 'package:bmi/models/calculation_model.dart';
// import 'package:bmi/pages/calculation_page.dart';
import 'package:bmi/repositories/calculation_page_repository.dart';

// import 'package:bmi/models/person.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultPage extends StatefulWidget {
  final List<CalculationModel> results;
  const ResultPage({Key? key, required this.results}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<CalculationModel> results = [];
  late CalculationPageRepository calculationPageRepository;

  @override
  void initState() {
    super.initState();
    initializeRepository();
  }

  Future<void> initializeRepository() async {
    calculationPageRepository = await CalculationPageRepository.load();
    results = calculationPageRepository.obterDados();
    results.sort((a, b) => b.date!.compareTo(a.date!));
    print("Number of results: ${results.length}");
    setState(() {});
  }

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
              itemCount: results.length,
              itemBuilder: (context, index) {
                final dateFormat = DateFormat(
                    "dd/MM/yyyy HH:mm:ss"); // Formate a data como desejado
                final formattedDate = dateFormat.format(results[index].date!);
                return Card(
                  child: ListTile(
                    title: Text(results[index].name ?? ""),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Idade: ${results[index].age}"),
                        Text("Altura: ${results[index].height}"),
                        Text("Peso: ${results[index].weight}"),
                        Text("IMC: ${results[index].bmi!.toStringAsFixed(2)}"),
                        Text("Diagnóstico:  ${results[index].diagnostic}"),
                        Text("Data: $formattedDate")
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
