import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HouseActions extends StatefulWidget {
  const HouseActions({super.key});

  @override
  State<HouseActions> createState() => _HouseActionsState();
}

class _HouseActionsState extends State<HouseActions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.heart,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
