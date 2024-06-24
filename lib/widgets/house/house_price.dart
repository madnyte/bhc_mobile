import 'package:flutter/material.dart';

class HousePrice extends StatelessWidget {
  const HousePrice(
      {super.key,
      required this.price,
      required this.addToFavorite,
      required this.isFavoured,
      required this.plan});

  final double price;
  final String plan;
  final Function() addToFavorite;
  final bool isFavoured;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'P $price/$plan',
          style: Theme.of(context).textTheme.headlineSmall?.apply(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        Material(
          shape: const CircleBorder(),
          child: Center(
            child: InkWell(
              onTap: addToFavorite,
              customBorder: const CircleBorder(),
              splashColor: Theme.of(context).colorScheme.primaryContainer,
              enableFeedback: true,
              child: Ink(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: isFavoured
                      ? Theme.of(context).colorScheme.surfaceContainerHighest
                      : Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite,
                  size: 20,
                  color: isFavoured
                      ? Colors.pink
                      : Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
