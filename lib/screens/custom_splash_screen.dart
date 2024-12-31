import 'package:flutter/material.dart';
import 'dart:math';

class CustomSplashScreenState extends StatefulWidget {
  const CustomSplashScreenState({Key? key}) : super(key: key);

  @override
  State<CustomSplashScreenState> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreenState> {
  late List<Color> _cubeColors;
  late List<bool> _isTouched;
  late Random _random;

  @override
  void initState() {
    super.initState();
    _random = Random();
    _cubeColors = List.generate(100, (index) => _generateRandomColor());
    _isTouched = List.generate(100, (index) => false);
  }

  Color _generateRandomColor() {
    return Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1,
    );
  }

  void _changeColor(int index) {
    setState(() {
      _cubeColors[index] = _generateRandomColor();
    });
  }

  void _toggleTouchState(int index, bool isTouched) {
    setState(() {
      _isTouched[index] = isTouched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.count(
        crossAxisCount: 10,
        children: List.generate(
          100,
          (index) => GestureDetector(
            onTap: () {
              _changeColor(index);
              // Odtwarzanie dźwięku po dotknięciu
              // implementacja dźwięku
            },
            onPanUpdate: (details) {
              _toggleTouchState(index, true);
              _changeColor(index);
            },
            onPanEnd: (details) {
              _toggleTouchState(index, false);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: _isTouched[index]
                    ? _cubeColors[index].withOpacity(0.5)
                    : _cubeColors[index],
                border: Border.all(color: Colors.black),
              ),
              // Dodatkowa funkcjonalność: odtwarzanie dźwięku po dotknięciu
            ),
          ),
        ),
      ),
    );
  }
}

/*



import 'package:flutter/material.dart';

class CustomizableSplashScreen extends StatefulWidget {
  const CustomizableSplashScreen({super.key});

  @override
  State<CustomizableSplashScreen> createState() =>
      _CustomizableSplashScreenState();
}

class _CustomizableSplashScreenState extends State<CustomizableSplashScreen> {
  Color backgroundColor = Colors.blue; // Domyślny kolor tła
  Color cubeColor = Colors.white; // Domyślny kolor sześcianów

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Przechwytywanie gestów
      onPanUpdate: (details) {
        // Obsługa przesunięcia palcem
        setState(() {
          // Zmiana koloru tła na przeciwny
          backgroundColor = _invertColor(backgroundColor);
          // Zmiana koloru sześcianów na przeciwny
          cubeColor = _invertColor(cubeColor);
        });
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: 100,
            height: 100,
            color: cubeColor,
            // Dodanie efektu dźwiękowego
            child: MaterialButton(
              onPressed: () {
                // Obsługa dotknięcia sześcianu
                // Odtworzenie dźwięku
                _playSound();
              },
              child: const Text('Cube'),
            ),
          ),
        ),
      ),
    );
  }

  // Funkcja zmieniająca kolor na przeciwny
  Color _invertColor(Color color) {
    return Color */