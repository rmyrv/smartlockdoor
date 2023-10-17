import 'package:flutter/material.dart';
import 'package:romyapp/pages/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
          ),
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            painter: BackgroundPainter(),
          ),
          Positioned(
            top: 70,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  'images/smartlock.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 300),
              Text(
                'Insert Your Password',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _textController,
                  obscureText: true, // Menyembunyikan teks yang dimasukkan
                  decoration: InputDecoration(
                    hintText: 'Enter your password here',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String enteredCode = _textController.text;
                  // Tambahkan logika untuk memverifikasi kode di sini
                  if (enteredCode == 'romi') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Dashboard(),
                      ),
                    );
                  } else {
                    // Kode salah, tampilkan pesan kesalahan
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Wrong Password'),
                          content: Text('Password yang anda masukkan salah!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Verify'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 92, 69, 241)
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, 0),
        radius: size.width / 1.2,
      ),
      0,
      3.14,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
