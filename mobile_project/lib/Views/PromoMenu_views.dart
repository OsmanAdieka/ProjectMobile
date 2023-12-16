// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PromoMenu extends StatefulWidget {
  @override
  _PromoMenuState createState() => _PromoMenuState();
}

class _PromoMenuState extends State<PromoMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promo Menu"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/Images/twh1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/Images/tiramisu_latte.jpg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Promo Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Our premium Caramel Latte is now having 70% off, Grab it now!!',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black // Teks rata kanan-kiri
                        ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Menampilkan pop up GIF
                        _showGifPopup(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // Warna latar belakang
                        onPrimary: Colors.black, // Warna teks
                      ),
                      child: Text('Grab this'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: DecorationImage(
                  image: AssetImage('assets/Images/twh2.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showGifPopup(BuildContext context) {
    // Implementasi pop up GIF
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/Gif/happycat.gif',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20),
              Text('CIE KETIPU'),
            ],
          ),
        );
      },
    );
  }
}
