import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            // * Safe area widget, Widget ini akan memberikan padding yang secara otomatis menyesuaikan perangkat yang digunakan.
            child: Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // TODO tips to inspect margins and paddings use devtools widget inspector
          Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: const Text(
                'Farm house Bandung',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child: const Center(
              child: Text(
                'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    )));
  }
}
