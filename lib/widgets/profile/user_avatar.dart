import 'dart:developer';

import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar(
      {super.key,
      required this.name,
      required this.userType,
      required this.imagePath});

  final String name;
  final String userType;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          maxRadius: 50,
          backgroundColor: Colors.white,
          foregroundImage: NetworkImage(imagePath),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headlineSmall?.apply(
                      color: Colors.black,
                    ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                userType,
                style: Theme.of(context).textTheme.labelLarge?.apply(
                      color: Colors.grey,
                    ),
              )
            ],
          ),
        )
      ],
    );
  }
}
