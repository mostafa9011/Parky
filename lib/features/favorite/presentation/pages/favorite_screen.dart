import 'package:flutter/material.dart';
import 'package:parky/features/favorite/presentation/widgets/favorite_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return const FavoriteCard();
        },
      ),
    );
  }
}
