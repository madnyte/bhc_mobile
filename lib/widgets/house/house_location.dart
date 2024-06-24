import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HouseLocation extends StatelessWidget {
  const HouseLocation({super.key, required this.location});

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.locationDot,
          size: 14,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            location,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall?.apply(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        )
      ],
    );
  }
}
