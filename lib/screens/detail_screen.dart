import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_list_app/model/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;
  static TextStyle informationStyleText = GoogleFonts.plusJakartaSans();

  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: _mobileView(context)));
  }

  Widget _mobileView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // TODO tips to inspect margins and paddings use devtools widget inspector
        // * Kita akan menggunakan widget Stack. Widget ini digunakan untuk menyusun widget seperti Column atau Row, bedanya widget pada Stack disusun secara bertumpuk (stacked).
        Stack(children: [
          Image.asset(
            place.imageAsset,
          ),
          // * Safe area widget, Widget ini akan memberikan padding yang secara otomatis menyesuaikan perangkat yang digunakan.
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                      ),
                      const FavoriteButtton(),
                    ],
                  )))
        ]),
        Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Text(
              place.name,
              textAlign: TextAlign.center,
              style: GoogleFonts.staatliches(
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
            )),
        Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(Icons.calendar_month),
                  const SizedBox(height: 5),
                  Text(place.openDays)
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.access_time),
                  const SizedBox(height: 5),
                  Text(place.openTime)
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.monetization_on),
                  const SizedBox(height: 5),
                  Text(place.ticketPrice)
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          child: Center(
            child: Text(
              place.description,
              textAlign: TextAlign.center,
              style: informationStyleText,
            ),
          ),
        ),
        SizedBox(
            height: 150,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: GestureDetector(
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (_) => ImageDialog(image: url));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(url),
                      ),
                    ),
                  );
                }).toList())),
      ],
    );
  }

  // Widget _webView(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.stretch,
  //     children: <Widget>[
  //       Image.asset(
  //         'images/farm-house.jpg',
  //         width: double.infinity,
  //       ),
  //       Container(
  //           margin: const EdgeInsets.only(top: 10.0),
  //           child: Text(
  //             'Farm house Bandung',
  //             textAlign: TextAlign.center,
  //             style: GoogleFonts.staatliches(
  //                 textStyle: const TextStyle(
  //                     fontSize: 30, fontWeight: FontWeight.bold)),
  //           )),
  //       Container(
  //         margin: const EdgeInsets.only(top: 16.0),
  //         child: const Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             Column(
  //               children: [
  //                 Icon(Icons.calendar_month),
  //                 SizedBox(height: 5),
  //                 Text('Open Everyday')
  //               ],
  //             ),
  //             Column(
  //               children: [
  //                 Icon(Icons.access_time),
  //                 SizedBox(height: 5),
  //                 Text('09:00 - 20:00')
  //               ],
  //             ),
  //             Column(
  //               children: [
  //                 Icon(Icons.monetization_on),
  //                 SizedBox(height: 5),
  //                 Text('Rp 25.000')
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         margin: const EdgeInsets.symmetric(vertical: 16.0),
  //         child: Center(
  //           child: Text(
  //             'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
  //             textAlign: TextAlign.center,
  //             style: informationStyleText,
  //           ),
  //         ),
  //       ),
  //       SizedBox(
  //           height: 150,
  //           child: ListView(
  //             scrollDirection: Axis.horizontal,
  //             children: [
  //               ClipRRect(
  //                 borderRadius: BorderRadius.circular(20.0),
  //                 child: GestureDetector(
  //                   onTap: () async {
  //                     await showDialog(
  //                         context: context,
  //                         builder: (_) => const ImageDialog(
  //                             image:
  //                                 'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'));
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(4.0),
  //                     child: Image.network(
  //                         'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
  //                   ),
  //                 ),
  //               ),
  //               ClipRRect(
  //                 borderRadius: BorderRadius.circular(20.0),
  //                 child: GestureDetector(
  //                   onTap: () async {
  //                     await showDialog(
  //                         context: context,
  //                         builder: (_) => const ImageDialog(
  //                             image:
  //                                 'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg'));
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(4.0),
  //                     child: Image.network(
  //                         'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg'),
  //                   ),
  //                 ),
  //               ),
  //               ClipRRect(
  //                 borderRadius: BorderRadius.circular(20.0),
  //                 child: GestureDetector(
  //                   onTap: () async {
  //                     await showDialog(
  //                         context: context,
  //                         builder: (_) => const ImageDialog(
  //                             image:
  //                                 'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'));
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(4.0),
  //                     child: Image.network(
  //                         'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
  //                   ),
  //                 ),
  //               ),
  //               ClipRRect(
  //                 borderRadius: BorderRadius.circular(20.0),
  //                 child: GestureDetector(
  //                   onTap: () async {
  //                     await showDialog(
  //                         context: context,
  //                         builder: (_) => const ImageDialog(
  //                             image:
  //                                 'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'));
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(4.0),
  //                     child: Image.network(
  //                         'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
  //                   ),
  //                 ),
  //               ),
  //               ClipRRect(
  //                 borderRadius: BorderRadius.circular(20.0),
  //                 child: GestureDetector(
  //                   onTap: () async {
  //                     await showDialog(
  //                         context: context,
  //                         builder: (_) => const ImageDialog(
  //                             image:
  //                                 'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'));
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(4.0),
  //                     child: Image.network(
  //                         'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
  //                   ),
  //                 ),
  //               ),
  //               ClipRRect(
  //                 borderRadius: BorderRadius.circular(20.0),
  //                 child: GestureDetector(
  //                   onTap: () async {
  //                     await showDialog(
  //                         context: context,
  //                         builder: (_) => const ImageDialog(
  //                             image:
  //                                 'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'));
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(4.0),
  //                     child: Image.network(
  //                         'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
  //                   ),
  //                 ),
  //               ),
  //               ClipRRect(
  //                 borderRadius: BorderRadius.circular(20.0),
  //                 child: GestureDetector(
  //                   onTap: () async {
  //                     await showDialog(
  //                         context: context,
  //                         builder: (_) => const ImageDialog(
  //                             image:
  //                                 'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'));
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(4.0),
  //                     child: Image.network(
  //                         'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
  //                   ),
  //                 ),
  //               ),
  //               ClipRRect(
  //                 borderRadius: BorderRadius.circular(20.0),
  //                 child: GestureDetector(
  //                   onTap: () async {
  //                     await showDialog(
  //                         context: context,
  //                         builder: (_) => const ImageDialog(
  //                             image:
  //                                 'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'));
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(4.0),
  //                     child: Image.network(
  //                         'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           )),
  //     ],
  //   );
  // }
}

class ImageDialog extends StatelessWidget {
  const ImageDialog({super.key, required this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Image.network(image!),
    );
  }
}

class FavoriteButtton extends StatefulWidget {
  const FavoriteButtton({super.key});

  @override
  State<StatefulWidget> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButtton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            {
              isFavorite = !isFavorite;
            }
          });
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_outline,
          color: Colors.red,
        ));
  }
}
