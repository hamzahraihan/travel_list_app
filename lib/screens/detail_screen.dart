import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_list_app/model/tourism_place.dart';
import 'package:travel_list_app/widgets/favorite_widget.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;
  static TextStyle informationStyleText = GoogleFonts.plusJakartaSans();

  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return SingleChildScrollView(child: _mobileView(context));
      } else {
        return SingleChildScrollView(child: WebView(place: place));
      }
    }));
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

class WebView extends StatefulWidget {
  final TourismPlace place;

  const WebView({super.key, required this.place});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
        child: Center(
            child: SizedBox(
          width: 1200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wisata Bandung',
                style: GoogleFonts.staatliches(fontSize: 32),
                textAlign: TextAlign.start,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          child: Image.asset(
                            widget.place.imageAsset,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Scrollbar(
                            controller: _scrollController,
                            child: SizedBox(
                              height: 100,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                controller: _scrollController,
                                children: widget.place.imageUrls.map((url) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      child: Image.network(
                                        url,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Card(
                        color: Colors.white,
                        clipBehavior: Clip.hardEdge,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(widget.place.name,
                                  style: GoogleFonts.staatliches(fontSize: 20)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.calendar_month),
                                            const SizedBox(width: 5),
                                            Text(widget.place.openDays)
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            const Icon(Icons.access_time),
                                            const SizedBox(width: 5),
                                            Text(widget.place.openTime)
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            const Icon(Icons.monetization_on),
                                            const SizedBox(width: 5),
                                            Text(widget.place.ticketPrice)
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        )
                                      ]),
                                  const FavoriteButtton()
                                ],
                              ),
                              Text(widget.place.description)
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              )
            ],
          ),
        )));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
