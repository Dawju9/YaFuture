import 'package:flutter/material.dart';

//import '../flutter_flow/flutter_flow_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Inicjalizacja animacji
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12), // Czas trwania animacji
    );

    // Ustawienie zakresu animacji (od 0 do 1)
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    // Rozpoczęcie animacji po zainicjalizowaniu ekranu
    _animationController.forward();

    // Przejście do kolejnego ekranu po zakończeniu animacji
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(
            context, '/home'); // Zastępuje aktualny ekran ekranem domowym
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Witaj w GrubMi!'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          ScaleTransition(
            scale: _animation,
            child: Image.asset(
              'assets/trolface.png',
              width: 200,
              height: 200,
            ),
          ),
          const Text('AyaGrubmi',
              style: TextStyle(fontSize: 55, fontFamily: 'Kalarn')),
          const SizedBox(height: 20),
          const Text('Kalkulator dla prawdziwego konia XDDD...',
              style: TextStyle(fontSize: 20, fontFamily: 'Kalarn')),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Przejdź do głównego ekranu',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Zwolnienie kontrolera animacji
    _animationController.dispose();
    super.dispose();
  }
}
