import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  static TextStyle informationStyleText = GoogleFonts.plusJakartaSans();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(

            // * Safe area widget, Widget ini akan memberikan padding yang secara otomatis menyesuaikan perangkat yang digunakan.
            child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // TODO tips to inspect margins and paddings use devtools widget inspector
          Image.asset(
            'images/farm-house.jpg',
            width: double.infinity,
          ),
          Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Farm house Bandung',
                textAlign: TextAlign.center,
                style: GoogleFonts.staatliches(
                    textStyle: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold)),
              )),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(height: 5),
                    Text('Open Everyday')
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.access_time),
                    SizedBox(height: 5),
                    Text('09:00 - 20:00')
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.monetization_on),
                    SizedBox(height: 5),
                    Text('Rp 25.000')
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Text(
                'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
                textAlign: TextAlign.center,
                style: informationStyleText,
              ),
            ),
          ),
          SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: GestureDetector(
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (_) => const ImageDialog());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(
                            'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                          'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                          'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg'),
                    ),
                  ),
                ],
              )),
        ],
      ),
    )));
  }
}

class ImageDialog extends StatelessWidget {
  const ImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Image.network(
          'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
    );
  }
}
