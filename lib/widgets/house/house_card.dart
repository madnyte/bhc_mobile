import 'dart:developer';

import 'package:bhc_mobile/models/house.dart';
import 'package:bhc_mobile/widgets/house/house_features.dart';
import 'package:bhc_mobile/widgets/house/house_location.dart';
import 'package:bhc_mobile/widgets/house/house_price.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HouseCard extends StatefulWidget {
  const HouseCard({super.key, required this.house});
  final House house;

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
        context.go('/house/${widget.house.id}');
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
                      image: NetworkImage(widget.house.thumbnail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.house.title,
                  style: Theme.of(context).textTheme.titleMedium?.apply(
                        color:
                            Theme.of(context).colorScheme.onPrimaryFixedVariant,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                HouseLocation(location: widget.house.location),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: HouseFeatures(
                      houseType: widget.house.type,
                      bedrooms: widget.house.no_of_rooms,
                      bathrooms: widget.house.no_of_bathrooms),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                HousePrice(
                  plan: widget.house.payment_method,
                  price: widget.house.price,
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
                widget.house.tags,
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
