import 'package:flutter/material.dart';
import 'package:travel_list_app/widgets/base_appbar_widget.dart';
import 'package:travel_list_app/widgets/tourism_place_grid_widget.dart';
import 'package:travel_list_app/widgets/tourism_place_list_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: const Text('Wisata Bandung'),
          appBar: AppBar(),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constrains) {
          if (constrains.maxWidth <= 600) {
            return const TourismPlaceList();
          } else if (constrains.maxWidth <= 900) {
            return const TourismPlaceGrid(
              gridCount: 4,
            );
          } else {
            return const TourismPlaceGrid(
              gridCount: 6,
            );
          }
        }));
  }
}
