import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Facilities extends StatelessWidget {
  const Facilities({super.key, required this.icon, required this.facilityInfo});

  final IconData icon;
  final String facilityInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.lightBlue.shade200,
          border: Border.all(color: Colors.grey.shade100)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(icon),
          const SizedBox(
            height: 5,
          ),
          Text(
            facilityInfo,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
