import 'package:bhc_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HouseFeatures extends StatelessWidget {
  const HouseFeatures(
      {super.key,
      required this.houseType,
      required this.bedrooms,
      required this.bathrooms});

  final HouseTypes houseType;
  final int bedrooms;
  final int bathrooms;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.house,
                size: 14,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                houseType.name,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.labelMedium?.apply(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.bed,
                size: 14,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                '$bedrooms ${bedrooms == 1 ? 'bedroom' : 'bedrooms'}',
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.labelMedium?.apply(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.bath,
                size: 14,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Center(
                child: Text(
                  '$bathrooms ${bathrooms == 1 ? 'bathrooms' : 'bathrooms'}',
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.labelMedium?.apply(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
