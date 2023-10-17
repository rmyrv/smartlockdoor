import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(), // Menggunakan DashboardScreen sebagai beranda
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment:
            Alignment.topCenter, // Mengatur posisi lingkaran ke pojok atas
        children: <Widget>[
          Container(
            color: Colors.white, // Warna latar belakang biru muda
            height: double.infinity, // Mengisi seluruh tinggi layar
            width: double.infinity, // Mengisi seluruh lebar layar
          ),
          // Lingkaran latar belakang putih di bagian atas body
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            painter: BackgroundPainter(),
          ),
          // Widget untuk menampilkan lingkaran penuh dengan bayangan
          Positioned(
            top: 70, // Mengatur posisi dari atas
            child: Container(
              width: 180, // Lebar lingkaran
              height: 180, // Tinggi lingkaran (sama dengan lebar)
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Mengubah kontainer menjadi lingkaran
                color: Color.fromARGB(
                    255, 255, 255, 255), // Warna latar belakang lingkaran
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                        0.5), // Warna bayangan (hitam dengan transparansi)
                    spreadRadius: 5, // Jarak penyebaran bayangan
                    blurRadius: 7, // Ketajaman bayangan
                    offset: Offset(0, 3), // Posisi bayangan (x, y)
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  'images/smartlock.png', // Lokasi gambar pintu di dalam lingkaran
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
                'Insert Your Code', // Status pintu terkunci
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Container(
                width: 200, // Lebar minimalis untuk input teks
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white, // Warna latar belakang putih
                  borderRadius:
                      BorderRadius.circular(10), // Mengatur sudut elemen
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                          0.5), // Warna bayangan (hitam dengan transparansi)
                      spreadRadius: 2, // Jarak penyebaran bayangan
                      blurRadius: 3, // Ketajaman bayangan
                      offset: Offset(0, 2), // Posisi bayangan (x, y)
                    ),
                  ],
                ),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Enter your code here', // Hint teks untuk input
                    border: InputBorder.none, // Hilangkan garis tepi
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String enteredCode = _textController.text;
                  // Tambahkan logika untuk memverifikasi kode di sini
                  if (enteredCode == 'romi') {
                    // Kode benar, lakukan tindakan yang sesuai di sini
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Door Unlocked'),
                          content: Text('The door has been unlocked.'),
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
                  } else {
                    // Kode salah, tampilkan pesan kesalahan
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Door Locked'),
                          content: Text('The entered code is incorrect.'),
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
                child: Text('Verify'), // Tombol untuk memverifikasi kode
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
      ..color = Color.fromARGB(255, 92, 69, 241) // Warna latar belakang putih
      ..style = PaintingStyle.fill;

    // Menggambar setengah lingkaran di bagian atas body
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, 0), // Pusat di atas
        radius: size.width / 1.2,
      ),
      0,
      3.14, // Membuat setengah lingkaran dengan sudut 180 derajat (pi)
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
