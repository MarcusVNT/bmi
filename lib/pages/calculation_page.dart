import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculationPage extends StatefulWidget {
  const CalculationPage({super.key});

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  var nameController = TextEditingController(text: "");
  var ageController = TextEditingController(text: "");
  var heightController = TextEditingController(text: "");
  var weightController = TextEditingController(text: "");

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
              onPressed: () {
                double bmi = double.parse(weightController.text) /
                    (double.parse(heightController.text) *
                        double.parse(heightController.text));

                print(nameController.text);
                print(ageController.text);
                print(heightController.text);
                print(weightController.text);
                print(bmi);
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
