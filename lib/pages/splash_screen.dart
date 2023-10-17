import 'package:flutter/material.dart';
import 'dart:async';
import 'package:romyapp/pages/home.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Menggunakan SplashScreen sebagai beranda
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 1), () {
      setState(() {
        opacity = 1.0;
      });
    });
    // Setelah beberapa detik, navigasikan ke layar berikutnya (misalnya, HomeScreen)
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.white
            ], // Warna gradasi dari biru ke putih
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/smartlock.png', // Ganti dengan path gambar Anda
                width: 150, // Sesuaikan lebar gambar sesuai keinginan Anda
                height: 150, // Sesuaikan tinggi gambar sesuai keinginan Anda
              ),
              SizedBox(height: 20),
              Animate(
                effects: [
                  FadeEffect(),
                  SlideEffect(),
                ],
                child: Text(
                  'Smart Lock Door',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Gabarito',
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DashboardScreen();
  }
}
