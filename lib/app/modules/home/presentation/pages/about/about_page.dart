import 'package:flutter/material.dart';

import '../../../../../constants/app_images.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre nós'),),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AppImages.logo, width: 200,)),
                const Text(
                  'Nós da ONG repense acreditamos que a educação e o acesso à informação de qualidade são fatores de extrema importância para que possamos mudar de vida. Nosso objetivo é bem simples:',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'FAZER A DIFERENÇA NA VIDA DAS PESSOAS.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Por isso decidimos constituir a repense, uma ONG que visa capacitar pessoas, conectando pessoas.',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
  }
}