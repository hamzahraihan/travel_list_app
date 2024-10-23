import 'package:flutter/material.dart';

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
