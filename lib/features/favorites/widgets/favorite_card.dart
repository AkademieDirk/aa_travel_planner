import 'package:aa_travel_planner/features/favorites/models/destination.dart';
import 'package:aa_travel_planner/features/favorites/widgets/remove_from_favorites_button.dart';

import "../repositories/favorites_repository.dart";

import 'package:flutter/material.dart';

import '../screens/favorites_details_screen.dart';

class FavoriteCard extends StatelessWidget {
  final Destination destination;
  final VoidCallback onRemove;
  final FavoritesRepository favoritesRepository;

  const FavoriteCard({
    super.key,
    required this.destination,
    required this.onRemove,
    required this.favoritesRepository,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 8,
      color: Colors.amber[100],
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesDetailsScreen(
                    destination: destination,
                    favoritesRepository: favoritesRepository,
                  ),
                ),
              ).then((_) => onRemove()); // Liste updaten bei Zurücknavigation
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/images/${destination.imageUrl}",
                        width: 80, height: 80, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(destination.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(destination.country,
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700])),
                    ],
                  ),
                ],
              ),
            ),
          ),
          RemoveFromFavoritesButton(
              favoritesRepository: favoritesRepository,
              destination: destination,
              onRemove: onRemove),
        ],
      ),
    );
  }
}
