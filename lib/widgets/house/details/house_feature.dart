import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HouseFeature extends StatelessWidget {
  const HouseFeature({super.key, required this.feature, required this.icon});

  final String feature;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10.0,
      ),
      padding: const EdgeInsets.all(
        10.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            size: 20,
            color: Colors.black54,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            feature,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.labelLarge?.apply(
                  color: Colors.black54,
                ),
          )
        ],
      ),
    );
  }
}
