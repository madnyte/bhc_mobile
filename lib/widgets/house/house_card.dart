import 'dart:developer';

import 'package:bhc_mobile/utils/constants.dart';
import 'package:bhc_mobile/widgets/house/house_features.dart';
import 'package:bhc_mobile/widgets/house/house_location.dart';
import 'package:bhc_mobile/widgets/house/house_price.dart';
import 'package:flutter/material.dart';

class HouseCard extends StatefulWidget {
  const HouseCard({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<HouseCard> createState() => _HouseCardState();
}

class _HouseCardState extends State<HouseCard> {
  bool isFavorite = false;

  void addToFavorites() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log("tapped");
      },
      child: Stack(
        children: [
          Container(
            height: 425,
            width: 300,
            margin: const EdgeInsets.only(right: 10.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage(widget.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '3 Bed Room Commercial House',
                  style: Theme.of(context).textTheme.titleMedium?.apply(
                        color:
                            Theme.of(context).colorScheme.onPrimaryFixedVariant,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const HouseLocation(location: 'Borolong, Maun'),
                const SizedBox(
                  height: 10.0,
                ),
                const Expanded(
                  child: HouseFeatures(
                      houseType: HouseTypes.apartment,
                      bedrooms: 1,
                      bathrooms: 1),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                HousePrice(
                  plan: 'm',
                  price: 3700,
                  isFavoured: isFavorite,
                  addToFavorite: addToFavorites,
                )
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 30,
            child: Chip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              side: BorderSide.none,
              label: Text(
                'New',
                style: Theme.of(context).textTheme.labelSmall?.apply(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
            ),
          )
        ],
      ),
    );
  }
}
