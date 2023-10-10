import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
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
                  const SizedBox(
                    height: 160,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Informe seu gênero e calcule seu IMC:',
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
                        ),
                      ),
                      const SizedBox(
                        height: 160,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 100,
                          ),
                          SizedBox(
                            width: 64,
                          ),
                          Icon(
                            Icons.person,
                            size: 100,
                          ),
                        ],
                      )
                    ],
                  ),
                ]),
              ),
            )));
  }
}
