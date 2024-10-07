import 'favorites_repository.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class Remove_From_Favorites_Button extends StatelessWidget {
  const Remove_From_Favorites_Button({
    super.key,
    required this.favoritesRepository,
    required this.destination,
    required this.onRemove,
  });

  final FavoritesRepository favoritesRepository;
  final Destination destination;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: GestureDetector(
        onTap: () {
          favoritesRepository.removeFavorite(destination);
          onRemove(); // Liste updaten bei Zurücknavigation
        },
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(6),
          child: const Icon(
            Icons.favorite,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
