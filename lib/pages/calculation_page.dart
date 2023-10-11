import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculationPage extends StatefulWidget {
  const CalculationPage({super.key});

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
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
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: const Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: 'Nome',
                      hintText: 'Nome',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: 'Idade',
                      hintText: 'Idade',
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: 'Altura',
                      hintText: 'Altura',
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
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
              onPressed: () {},
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
