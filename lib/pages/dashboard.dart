import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dashboard();
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _textController = TextEditingController();
  bool isDoorOn = false; // Variabel untuk mengontrol status pintu

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
          Positioned(
            top: 450, // Mengatur posisi tombol ke bawah
            child: Container(
              padding: EdgeInsets.all(10), // Memberikan padding ke Container
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255,
                    255), // Mengatur warna persegi menjadi abu-abu
                borderRadius: BorderRadius.circular(
                    15), // Membuat ujung persegi tidak lancip
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'DOOR STATUS',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Toggle status pintu ketika tombol ditekan
                      setState(() {
                        isDoorOn = !isDoorOn;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: isDoorOn
                          ? Colors.green
                          : Colors
                              .red, // Ganti warna latar belakang sesuai status pintu
                    ),
                    child: Text(
                      isDoorOn
                          ? 'UNLOCKED'
                          : 'LOCKED', // Ganti teks tombol sesuai status pintu
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
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
