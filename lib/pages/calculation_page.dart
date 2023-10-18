import 'package:bmi/models/calculation_model.dart';
// import 'package:bmi/models/person.dart';
import 'package:bmi/pages/result_page.dart';
import 'package:bmi/repositories/calculation_page_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculationPage extends StatefulWidget {
  const CalculationPage({super.key});

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  var result = <CalculationModel>[];
  late CalculationPageRepository calculationPageRepository;
  var calculationModel = CalculationModel.vazio();

  var nameController = TextEditingController(text: "");
  var ageController = TextEditingController(text: "");
  var heightController = TextEditingController(text: "");
  var weightController = TextEditingController(text: "");
  String diagnostic = "";

  List<CalculationModel> results = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterDados();
  }

  void obterDados() async {
    calculationPageRepository = await CalculationPageRepository.load();
    // calculationModel = calculationPageRepository.obterDados();
    // calculationModel = calculationPageRepository.obterDados().isNotEmpty
    //     ? calculationPageRepository.obterDados().first
    //     : CalculationModel.vazio();

    // nameController.text = calculationModel.name ?? "";
    // ageController.text = calculationModel.age.toString();
    // heightController.text = calculationModel.height.toString();
    // weightController.text = calculationModel.weight.toString();

    final data = calculationPageRepository.obterDados();
    if (data.isNotEmpty) {
      setState(() {
        calculationModel = data.first;
        nameController.text = calculationModel.name ?? "";
        ageController.text = calculationModel.age.toString();
        heightController.text = calculationModel.height.toString();
        weightController.text = calculationModel.weight.toString();
      });
    }
    // setState(() {});
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
            'Calculadora de IMC',
          ),
        ),
        body: SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(children: [
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Informe os dados abaixo:",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    shadows: [
                      const Shadow(
                        blurRadius: 20.0,
                        color: Color.fromARGB(255, 38, 37, 80),
                        offset: Offset(2.0, 5.0),
                      ),
                    ],
                  )),
            ),
            const SizedBox(height: 32),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: 'Nome',
                      hintText: 'Nome',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: 'Idade',
                      hintText: 'Idade',
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: heightController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: 'Altura',
                      hintText: 'Altura',
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: weightController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: 'Peso',
                      hintText: 'Peso',
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            TextButton(
              onPressed: () async {
                if (nameController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, informe o seu nome.'),
                    ),
                  );
                  return;
                }
                if (ageController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, informe a sua idade.'),
                    ),
                  );
                  return;
                }
                if (heightController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, informe a sua altura.'),
                    ),
                  );
                  return;
                }
                if (weightController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, informe o seu peso.'),
                    ),
                  );
                  return;
                }

                double bmi = double.parse(weightController.text) /
                    (double.parse(heightController.text) *
                        double.parse(heightController.text));

                if (bmi < 18.5) {
                  diagnostic = "Abaixo do peso";
                } else if (bmi <= 24.9) {
                  diagnostic = "Peso normal";
                } else if (bmi <= 29.9) {
                  diagnostic = "Sobrepeso";
                } else if (bmi <= 34.9) {
                  diagnostic = "Obesidade grau 1";
                } else if (bmi <= 39.9) {
                  diagnostic = "Obesidade grau 2";
                } else if (bmi >= 40) {
                  diagnostic = "Obesidade grau 3";
                }

                final result = CalculationModel.create(
                    nameController.text,
                    int.parse(ageController.text),
                    double.parse(weightController.text),
                    double.parse(heightController.text),
                    bmi,
                    diagnostic,
                    DateTime.now());

                await calculationPageRepository.save(result);

                results.add(result);

                setState(() {
                  calculationModel = result;
                  // Limpe os campos e a variável diagnostic
                  nameController.text = "";
                  ageController.text = "";
                  heightController.text = "";
                  weightController.text = "";
                  diagnostic = "";
                });

                Future.delayed(const Duration(milliseconds: 2), () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResultPage(results: results);
                  }));
                });
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 8)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 51, 51, 182),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              child: Text('Calcular', style: GoogleFonts.poppins(fontSize: 20)),
            ),
            const SizedBox(height: 32),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResultPage(results: results);
                  }));
                },
                child: Text(
                  "Resultados",
                  style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                )),
            Container(
                margin: const EdgeInsets.only(top: 160),
                child:
                    const Text("Todos os direitos reservados a @MarcusVNT.")),
            const SizedBox(height: 32),
          ]),
        )),
      ),
    );
  }
}
