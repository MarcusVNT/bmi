import 'package:bmi/pages/calculation_page.dart';
import 'package:bmi/shared/widgets/app_images.dart';
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
                    height: 200,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Informe seu gênero e calcule seu Indice de Massa Corporal:',
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
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CalculationPage(),
                                  ));
                            },
                            child: Image.asset(
                              AppImages.mulher,
                              height: 240,
                            ),
                          ),
                          // const SizedBox(
                          //   width: 64,
                          // ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CalculationPage(),
                                    ));
                              },
                              child: Image.asset(AppImages.homem, height: 184)),
                        ],
                      )
                    ],
                  ),
                ]),
              ),
            )));
  }
}
